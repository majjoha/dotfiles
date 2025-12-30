require("luasnip").setup({})

require("luasnip.loaders.from_snipmate").lazy_load({
  paths = {
    vim.fn.stdpath("config") .. "/pack/packages/start/vim-snippets/snippets",
    vim.fn.stdpath("config") .. "/after/snippets",
  },
})
