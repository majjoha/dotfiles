-- Resize splits when the window is resized
local resize_splits_group = vim.api.nvim_create_augroup("ResizeSplits", {})
vim.api.nvim_create_autocmd("VimResized", {
  pattern = "*",
  command = "wincmd =",
  group = resize_splits_group,
})

-- Open help pages in a vertical split
vim.api.nvim_create_autocmd(
  "Filetype",
  { pattern = "help", command = "wincmd L" }
)

-- Auto-clean Fugitive buffers
-- Source: http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
local clean_fugitive_buffers_group =
  vim.api.nvim_create_augroup("CleanFugitiveBuffers", {})
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "fugitive://*",
  callback = function()
    vim.opt.bufhidden = "delete"
  end,
  group = clean_fugitive_buffers_group,
})

-- Hide status line in terminal mode and start in insert mode. Delete the buffer
-- when it is no longer displayed.
local terminal_mode_group = vim.api.nvim_create_augroup("TerminalMode", {})
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.wo.statusline = " "
    vim.wo.statuscolumn = ""
    vim.api.nvim_command("startinsert")
  end,
  group = terminal_mode_group,
})
vim.api.nvim_create_autocmd("TermLeave", {
  pattern = "term://*",
  callback = function()
    vim.opt.bufhidden = "delete"
  end,
  group = terminal_mode_group,
})

-- Format files on save
local lsp_mode_group = vim.api.nvim_create_augroup("LSPMode", {})
local lsp_formatting_group = vim.api.nvim_create_augroup("LSPFormatting", {})
vim.api.nvim_create_autocmd("LSPAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_clear_autocmds({
        group = lsp_formatting_group,
        buffer = bufnr,
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function(_)
          vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 5000 })
        end,
        group = lsp_formatting_group,
      })
    end
  end,
  group = lsp_mode_group,
})

vim.api.nvim_create_autocmd("LSPDetach", {
  callback = function(_)
    vim.opt_local.tagfunc = nil
    vim.opt_local.omnifunc = nil
  end,
  group = lsp_mode_group,
})

-- Set mappings for opening file in split using `MiniFiles`
local map_split = function(buf_id, lhs, direction)
  local rhs = function()
    -- Make new window and set it as target
    local new_target_window
    vim.api.nvim_win_call(
      MiniFiles.get_explorer_state().target_window,
      function()
        vim.cmd(direction .. " split")
        new_target_window = vim.api.nvim_get_current_win()
      end
    )

    MiniFiles.set_target_window(new_target_window)
    MiniFiles.go_in()
    MiniFiles.close()
  end

  -- Adding `desc` will result into `show_help` entries
  local desc = "Split " .. direction
  vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
end

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesBufferCreate",
  callback = function(args)
    local buf_id = args.data.buf_id
    -- Tweak keys to your liking
    map_split(buf_id, "gs", "belowright horizontal")
    map_split(buf_id, "gv", "belowright vertical")
  end,
})

-- Highlight text on yank
local highlight_on_yank_group =
  vim.api.nvim_create_augroup("HighlightOnYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 150, visual = true })
  end,
  group = highlight_on_yank_group,
})

-- Highlight references under cursor
local lsp_document_highlight_group =
  vim.api.nvim_create_augroup("LSPDocumentHighlight", {})

local highlight_node_types = {
  "constant",
  "constructor",
  "declarations",
  "identifier",
  "instance_variable",
  "name",
  "simple_symbol",
  "variable",
}

local function has_document_highlight_support()
  return vim.iter(vim.lsp.get_clients({ bufnr = 0 })):any(function(client)
    return client.server_capabilities.documentHighlightProvider
  end)
end

local function should_highlight()
  local node = vim.treesitter.get_node()
  if not node then
    return false
  end

  local node_type = node:type()
  return vim.iter(highlight_node_types):any(function(t)
    return node_type:match(t)
  end)
end

local function conditional_document_highlight()
  if not has_document_highlight_support() then
    return
  end

  if should_highlight() then
    vim.lsp.buf.document_highlight()
  else
    vim.lsp.buf.clear_references()
  end
end

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  callback = conditional_document_highlight,
  group = lsp_document_highlight_group,
})

vim.api.nvim_create_autocmd("CursorMoved", {
  callback = function()
    if has_document_highlight_support() then
      vim.lsp.buf.clear_references()
    end
  end,
  group = lsp_document_highlight_group,
})

-- Highlight comment blocks with background colors
local comment_block_group =
  vim.api.nvim_create_augroup("CommentBlockHighlight", {})
vim.api.nvim_create_autocmd({
  "BufEnter",
  "InsertLeave",
  "TextChanged",
  "TextChangedI",
}, {
  pattern = "*",
  callback = function(args)
    require("comment_block").highlight_comment_blocks(args.buf)
  end,
  group = comment_block_group,
})
