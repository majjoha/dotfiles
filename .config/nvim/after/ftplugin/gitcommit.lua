-- Use spell checker
vim.opt_local.spelllang = "en_us"

-- Set text width to 72
vim.opt_local.textwidth = 72

-- Enable completion
vim.opt_local.complete = vim.opt_local.complete + "kspell"

-- Look up commits with `K`
vim.opt_local.keywordprg = ":Git show"
