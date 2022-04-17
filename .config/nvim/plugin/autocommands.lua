-- Resize splits when the window is resized
vim.api.nvim_create_augroup("ResizeSplits", {})
vim.api.nvim_create_autocmd("VimResized", {
  pattern = "*",
  command = "wincmd =",
  group = "ResizeSplits",
})

-- Auto-clean Fugitive buffers
-- Source: http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
vim.api.nvim_create_augroup("CleanFugitiveBuffers", {})
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "fugitive://*",
  command = "set bufhidden=delete",
  group = "CleanFugitiveBuffers",
})

-- Remove line numbers in terminal mode, start it in insert mode and delete the
-- buffer when it is no longer displayed
vim.api.nvim_create_augroup("TerminalMode", {})
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  command = [[
    setlocal nonumber norelativenumber signcolumn=no statusline=\ | startinsert
  ]],
  group = "TerminalMode",
})
vim.api.nvim_create_autocmd("TermLeave", {
  pattern = "term://*",
  command = "set bufhidden=delete",
  group = "TerminalMode",
})

-- Customize colors
-- See https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
vim.api.nvim_create_augroup("CustomizeColors", {})
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = require("majjoha").customize_colors,
  group = "CustomizeColors",
})
