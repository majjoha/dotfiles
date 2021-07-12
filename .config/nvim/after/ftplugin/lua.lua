-- Use `lua-format` for formatting
vim.opt_local.formatprg = "lua-format -i"

-- Do not add `--` on a new line when hitting `o` on a commented line
vim.opt_local.formatoptions = vim.opt_local.formatoptions - 'o'
