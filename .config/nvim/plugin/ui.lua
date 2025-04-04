-- Set theme
vim.cmd.colorscheme("base16")
vim.opt.background = "dark"
vim.opt.termguicolors = false

-- Enable relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set text width to 80 and mark column 81
vim.opt.textwidth = 80
vim.opt.colorcolumn = "+1"

-- Always show the status line
vim.opt.laststatus = 2

vim.opt.fillchars = {
  -- Suppress the `~` character at the end of the buffer
  eob = " ",
  diff = "╱",
}

-- Show the current mode
vim.opt.showmode = true

-- Do not display key strokes
vim.opt.showcmd = false

-- Always display the sign column
vim.opt.signcolumn = "yes:1"

-- Use single line borders for floating windows
vim.opt.winborder = "single"

-- Set status column to show signs and then right-aligned numbers followed by a
-- separator
vim.opt.statuscolumn = "%s%=%l %#WinSeparator#│ "
