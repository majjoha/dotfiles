-- Include `!` when deleting words
vim.opt_local.iskeyword = vim.opt_local.iskeyword + "!"

-- Do not add `//` on a new line when hitting `o` on a commented line
vim.opt_local.formatoptions = vim.opt_local.formatoptions - 'o'
