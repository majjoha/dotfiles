-- Do not add `%` on a new line when hitting `o` on a commented line
vim.opt_local.formatoptions = vim.opt_local.formatoptions - 'o'

-- Use `%%` for comments instead of a single `%`
vim.opt_local.commentstring = "%% %s"
