-- Resize splits when the window is resized
local resize_splits_group = vim.api.nvim_create_augroup("ResizeSplits", {})
vim.api.nvim_create_autocmd("VimResized", {
  pattern = "*",
  command = "wincmd =",
  group = resize_splits_group,
})

-- Open help pages in a vertical split
vim.api.nvim_create_autocmd("Filetype",
  { pattern = "help", command = "wincmd L" })

-- Auto-clean Fugitive buffers
-- Source: http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
local clean_fugitive_buffers_group = vim.api.nvim_create_augroup(
  "CleanFugitiveBuffers", {})
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

-- Customize colors
-- See https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
local customize_colors_group = vim.api
    .nvim_create_augroup("CustomizeColors", {})
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- Set the background color of the line numbers to transparent
    vim.api.nvim_set_hl(0, "LineNr", { ctermbg = 00 })

    -- Remove background color for fold column
    vim.api.nvim_set_hl(0, "FoldColumn", { link = "Normal" })

    -- Set the color of the vertical split bar to transparent
    vim.api.nvim_set_hl(0, "VertSplit", { ctermbg = 00 })
    vim.api.nvim_set_hl(0, "WinSeparator", { ctermfg = 10 })

    -- Show the current mode in a darker, non-bold font
    vim.api.nvim_set_hl(0, "ModeMsg", { ctermfg = 08, cterm = {} })

    -- Set the background of the status line in the current buffer to match the
    -- color column, and the status line in all inactive buffers to transparent
    vim.api.nvim_set_hl(0, "StatusLine", { ctermbg = 10, ctermfg = 07 })
    vim.api.nvim_set_hl(0, "StatusLineNC", { ctermbg = 10, ctermfg = 08 })

    -- Set the sign column to have a transparent background and define the
    -- foreground colors for the various signs
    vim.api.nvim_set_hl(0, "SignColumn", { ctermbg = 00 })
    vim.api
        .nvim_set_hl(0, "DiagnosticSignError", { ctermfg = 01, ctermbg = 00 })
    vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { ctermfg = 03, ctermbg = 00 })
    vim.api.nvim_set_hl(0, "DiagnosticSignHint", { ctermfg = 07, ctermbg = 00 })
    vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { ctermfg = 07, ctermbg = 00 })

    -- Set underline colors for diagnostics
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true })

    -- Define colors for floating windows
    vim.api.nvim_set_hl(0, "NormalFloat", { ctermbg = 10 })
    vim.api.nvim_set_hl(0, "FloatBorder", { ctermbg = 10 })

    -- Set spelling errors to be red and emphasize them using undercurl
    vim.api.nvim_set_hl(0, "SpellBad", { ctermfg = 01, undercurl = true })
    vim.api.nvim_set_hl(0, "SpellCap", { ctermfg = 01, undercurl = true })

    -- Set colors for floating windows
    vim.api.nvim_set_hl(0, "FloatBorder", { ctermfg = 07, ctermbg = 00 })
    vim.api.nvim_set_hl(0, "NormalFloat", { ctermbg = 00 })

    -- Set color for virtual color column
    vim.api.nvim_set_hl(0, "NonText", { ctermfg = 10 })

    -- Set colors for Markdown headlines
    vim.api.nvim_set_hl(0, "Headline1", { ctermbg = 00, bold = true })
    vim.api.nvim_set_hl(0, "Headline2", { ctermbg = 10, bold = true })
    vim.api.nvim_set_hl(0, "Headline3", { ctermbg = 00, bold = true })
    vim.api.nvim_set_hl(0, "CodeBlock", { ctermbg = 10 })
    vim.api.nvim_set_hl(0, "Dash", { ctermfg = 10 })

    local links = {
      ['@lsp.type.namespace'] = '@namespace',
      ['@lsp.type.type'] = '@type',
      ['@lsp.type.class'] = '@type',
      ['@lsp.type.enum'] = '@type',
      ['@lsp.type.interface'] = '@type',
      ['@lsp.type.struct'] = '@structure',
      ['@lsp.type.parameter'] = '@parameter',
      ['@lsp.type.variable'] = '@variable',
      ['@lsp.type.property'] = '@property',
      ['@lsp.type.enumMember'] = '@constant',
      ['@lsp.type.function'] = '@function',
      ['@lsp.type.method'] = '@method',
      ['@lsp.type.macro'] = '@macro',
      ['@lsp.type.decorator'] = '@function',
    }
    for newgroup, oldgroup in pairs(links) do
      vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
    end
  end,
  group = customize_colors_group,
})

-- Format files on save
local lsp_mode_group = vim.api.nvim_create_augroup("LSPMode", {})
vim.api.nvim_create_autocmd("LSPAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client.server_capabilities.documentFormattingProvider then
      local lsp_formatting_group = vim.api.nvim_create_augroup("LSPFormatting",
        {})

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
    vim.api.nvim_win_call(MiniFiles.get_explorer_state().target_window,
      function()
        vim.cmd(direction .. " split")
        new_target_window = vim.api.nvim_get_current_win()
      end)

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
