-- Skip if `vim-test` is not loaded
if not vim.g.loaded_test then
  return
end

-- Use Neovim strategy for `vim-test`
vim.g["test#strategy"] = "neovim"
