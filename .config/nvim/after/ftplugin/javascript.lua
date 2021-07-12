-- Do not add `//` on a new line when hitting `o` on a commented line
vim.opt_local.formatoptions = vim.opt_local.formatoptions - 'o'

-- Use `node --check` to run syntax check
vim.opt_local.makeprg = "node --check %"
