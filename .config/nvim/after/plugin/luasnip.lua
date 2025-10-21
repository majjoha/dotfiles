require("luasnip").setup({})

require("luasnip.loaders.from_snipmate").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load(
  { paths = "~/.config/nvim/pack/packages/start/vim-snippets/snippets" }
)
