-- comment_block: Highlight standalone comment blocks with background
-- and optional marker dimming using Treesitter.
local M = {}
local ns = vim.api.nvim_create_namespace("comment_block")

local HIGHLIGHT_PRIORITY = 100
local MARKER_PRIORITY = 110
local COMMENT_STRING_PATTERN = "^%s*(.-)%s*%%s"
local COMMENT_QUERY = "(comment) @comment"
local REGEX_SPECIAL_CHARS = "([%^%$%(%)%%%.%[%]%*%+%-%?])"

M.config = {
  target_column = 80, -- Minimum block width if all lines are shorter
  highlight_group = "CommentBlock",
  marker_highlight_group = "CommentBlockMarker",
  dim_markers = true,
  excluded_patterns = {},
  excluded_filetypes = {}, -- Filetypes to skip (e.g., { "markdown", "text" })
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

local function escape_regex(str)
  return str:gsub(REGEX_SPECIAL_CHARS, "%%%1")
end

-- Collect standalone comment nodes using Treesitter queries
local function collect_comment_nodes(bufnr)
  local ok, parser = pcall(vim.treesitter.get_parser, bufnr)
  if not ok or not parser then
    return {}
  end

  local lang = parser:lang()
  local query_ok, query = pcall(vim.treesitter.query.parse, lang, COMMENT_QUERY)
  if not query_ok then
    return {}
  end

  local comments = {}

  for _, tree in ipairs(parser:parse()) do
    for _, node in query:iter_captures(tree:root(), bufnr) do
      local start_row, start_col, end_row = node:range()
      local line =
        vim.api.nvim_buf_get_lines(bufnr, start_row, start_row + 1, false)[1]

      if line then
        local text = vim.treesitter.get_node_text(node, bufnr) or ""

        -- Skip comments matching excluded patterns (configurable)
        local should_exclude = false
        if M.config.excluded_patterns then
          for _, pattern in ipairs(M.config.excluded_patterns) do
            if text:match(pattern) then
              should_exclude = true
              break
            end
          end
        end

        if not should_exclude then
          -- Only include standalone comments (no code before them).
          -- Comments must have only whitespace before them on their line.
          if line:sub(1, start_col):match("^%s*$") then
            table.insert(comments, {
              start_row = start_row,
              start_col = start_col,
              end_row = end_row,
            })
          end
        end
      end
    end
  end

  table.sort(comments, function(a, b)
    return a.start_row < b.start_row
  end)
  return comments
end

-- Group consecutive comments (same column, adjacent rows) into blocks
-- for unified background highlighting. A new block starts when comments
-- are separated by a non-comment line or change indentation.
-- Assumes line-based comments (e.g., //, #, --); multi-line comments not
-- supported.
local function group_into_blocks(comments)
  if #comments == 0 then
    return {}
  end

  local blocks = {}
  local current_block = { comments[1] }

  -- Skip first comment (already initialized in current_block above)
  for i = 2, #comments do
    local prev = current_block[#current_block]
    local curr = comments[i]

    if
      curr.start_row == prev.end_row + 1 and curr.start_col == prev.start_col
    then
      table.insert(current_block, curr)
    else
      table.insert(blocks, current_block)
      current_block = { curr }
    end
  end

  table.insert(blocks, current_block)
  return blocks
end

-- Apply highlighting to one comment block. Calculates block width on first
-- pass through lines, then applies all highlights in a single iteration.
local function highlight_block(bufnr, block, marker)
  -- Escape marker pattern once for the entire block
  local escaped_marker = marker and escape_regex(marker)

  -- First pass: collect all lines and calculate max width
  local lines_by_row = {}
  local max_width = M.config.target_column

  for _, comment in ipairs(block) do
    for row = comment.start_row, comment.end_row do
      if not lines_by_row[row] then
        local line = vim.api.nvim_buf_get_lines(bufnr, row, row + 1, false)[1]
        lines_by_row[row] = line
        if line then
          max_width = math.max(max_width, #line)
        end
      end
    end
  end

  -- Second pass: apply highlights with known max_width
  for _, comment in ipairs(block) do
    for row = comment.start_row, comment.end_row do
      local line = lines_by_row[row]
      if line then
        local line_len = #line
        local start_col = comment.start_col

        -- Base highlight from comment start to end of line
        vim.api.nvim_buf_set_extmark(bufnr, ns, row, start_col, {
          end_col = line_len,
          hl_group = M.config.highlight_group,
          priority = HIGHLIGHT_PRIORITY,
        })

        -- Add padding if needed
        if line_len < max_width then
          local padding = string.rep(" ", max_width - line_len)
          vim.api.nvim_buf_set_extmark(bufnr, ns, row, line_len, {
            virt_text = { { padding, M.config.highlight_group } },
            virt_text_pos = "overlay",
            priority = HIGHLIGHT_PRIORITY,
          })
        end

        -- Overlay dimmed marker if enabled. The marker pattern is searched
        -- at the start of the comment text to visually separate it from the
        -- body, allowing readers to distinguish between marker and content.
        if escaped_marker and start_col < #line then
          -- Neovim APIs (Treesitter, extmarks) use 0-based indexing to align
          -- with LSP and C conventions, while Lua strings use 1-based
          -- indexing. We must convert between these when extracting and
          -- analyzing text.
          local comment_text = line:sub(start_col + 1)
          local _, marker_end =
            comment_text:find("^(%s*" .. escaped_marker .. "%s?)")

          if marker_end then
            vim.api.nvim_buf_set_extmark(bufnr, ns, row, start_col, {
              end_col = start_col + marker_end,
              hl_group = M.config.marker_highlight_group,
              priority = MARKER_PRIORITY,
            })
          end
        end
      end
    end
  end
end

-- Highlight comment blocks in buffer. If no buffer provided, use current.
function M.highlight_comment_blocks(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  -- Skip excluded filetypes
  local filetype = vim.bo[bufnr].filetype
  if vim.tbl_contains(M.config.excluded_filetypes, filetype) then
    return
  end

  vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

  local comments = collect_comment_nodes(bufnr)
  local blocks = group_into_blocks(comments)

  -- Extract comment marker from commentstring if marker dimming is enabled
  local marker
  if M.config.dim_markers then
    marker = (vim.bo[bufnr].commentstring or ""):match(COMMENT_STRING_PATTERN)
  end

  for _, block in ipairs(blocks) do
    highlight_block(bufnr, block, marker)
  end
end

return M
