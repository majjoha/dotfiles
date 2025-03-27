return {
  cmd = { "haskell-language-server-wrapper", "--lsp" },
  root_markers = {
    "hie.yaml", "stack.yaml", "cabal.project", "*.cabal", "package.yaml",
  },
  filetypes = { "haskell", "lhaskell" },
  single_file_support = true,
  settings = {
    haskell = {
      formattingProvider = "stylish-haskell",
      cabalFormattingProvider = "cabalfmt",
    },
  },
}
