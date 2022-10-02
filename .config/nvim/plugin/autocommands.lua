-- Resize splits when the window is resized
local resize_splits_group = vim.api.nvim_create_augroup("ResizeSplits", {})
vim.api.nvim_create_autocmd("VimResized", {
  pattern = "*",
  command = "wincmd =",
  group = resize_splits_group,
})

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

-- Remove line numbers in terminal mode, start it in insert mode and delete the
-- buffer when it is no longer displayed
local terminal_mode_group = vim.api.nvim_create_augroup("TerminalMode", {})
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.wo.signcolumn = "no"
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

    -- Define colors for floating windows
    vim.api.nvim_set_hl(0, "NormalFloat", { ctermbg = 00 })
    vim.api.nvim_set_hl(0, "FloatBorder", { ctermbg = 00 })

    -- Hide status line for NvimTree buffer
    vim.api.nvim_set_hl(0, "NvimTreeStatusLineNC",
                        { ctermbg = 00, ctermfg = 00 })
    vim.api.nvim_set_hl(0, "NvimTreeStatusLine", { ctermbg = 00, ctermfg = 00 })
  end,
  group = customize_colors_group,
})
