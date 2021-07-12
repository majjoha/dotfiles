-- Do not add `//` on a new line when hitting `o` on a commented line
vim.opt_local.formatoptions = vim.opt_local.formatoptions - 'o'

-- Use ALE to move to definitions
vim.api.nvim_buf_set_keymap(0, "n", "<C-]>", ":ALEGoToDefinition<CR>",
                            { noremap = true })
