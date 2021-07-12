-- Skip if Neosnippet is not loaded
if not vim.g.loaded_neosnippet then
  return
end

-- Disable default snippets
vim.g["neosnippet#disable_runtime_snippets"] = { _ = 1 }

-- Enable compatibility with snipMate
vim.g["neosnippet#enable_snipmate_compatibility"] = 1

-- Tell Neosnippet about the other snippets
vim.g["neosnippet#snippets_directory"] = {
  vim.fn.expand("~/.config/nvim/pack/packages/start/vim-snippets/snippets"),
  vim.fn.expand("~/.config/nvim/snippets"),
}
