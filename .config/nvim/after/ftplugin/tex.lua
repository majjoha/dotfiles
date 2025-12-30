-- Use thesaurus
vim.opt_local.thesaurus = vim.opt_local.thesaurus
  + vim.fn.expand(vim.fn.stdpath("config") .. "/thesaurus/thesaurus.txt")

-- Set text width to 80
vim.opt_local.textwidth = 80

-- Enable completion
vim.opt_local.complete = vim.opt_local.complete + "kspell"
