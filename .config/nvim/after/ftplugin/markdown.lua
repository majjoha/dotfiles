-- Use thesaurus
vim.opt_local.thesaurus = vim.opt_local.thesaurus +
                            vim.fn
                              .expand("~/.config/nvim/thesaurus/thesaurus.txt")

-- Set text width to 80
vim.opt_local.textwidth = 80

-- Enable completion
vim.opt_local.complete = vim.opt_local.complete + "kspell"

-- Use two spaces for tabs in Markdown files
vim.opt_local.expandtab = true
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
