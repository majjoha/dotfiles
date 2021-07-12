-- Set `:help` as keywordprg instead of man
vim.opt_local.keywordprg = ":help"

-- Do not add `"` on a new line when hitting `o` on a commented line
vim.opt_local.formatoptions = vim.opt_local.formatoptions - 'o'

-- Do not include `#` when deleting words
vim.opt_local.iskeyword = vim.opt_local.iskeyword - "#"
