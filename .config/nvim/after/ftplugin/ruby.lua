-- Include `!` and `?` when deleting words
vim.opt_local.iskeyword = vim.opt_local.iskeyword + "!" + "?"

-- Open `ri` in a terminal
-- vim.opt_local.keywordprg = ":tabe | term ri"

-- Do not add `#` on a new line when hitting `o` on a commented line
vim.opt_local.formatoptions = vim.opt_local.formatoptions - 'o'
