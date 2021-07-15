-- Set theme
vim.g.colors_name = "base16"
vim.opt.background = "dark"

-- Enable relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set color column to 80
vim.opt.colorcolumn = "80"

-- Always show the status line
vim.opt.laststatus = 2

vim.opt.fillchars = {
  -- Blend vertical separator and line numbers
  vert = " ",
  -- Supress the `~` character at the end of the buffer
  eob = " ",
}

-- Show the current mode
vim.opt.showmode = true

-- Do not display key strokes
vim.opt.showcmd = false
