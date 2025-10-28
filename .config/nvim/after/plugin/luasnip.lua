require("luasnip").setup({})

require("luasnip.loaders.from_snipmate").lazy_load({
  paths = {
    "~/.config/nvim/pack/packages/start/vim-snippets/snippets",
    "~/.config/nvim/after/snippets",
  },
})
