return {
  cmd = { "harper-ls", "--stdio" },
  root_markers = { ".git" },
  filetypes = {
    "c", "cpp", "cs", "gitcommit", "go", "html", "java", "javascript", "lua",
    "markdown", "nix", "python", "ruby", "rust", "swift", "toml", "typescript",
    "typescriptreact", "haskell", "cmake", "typst", "php", "dart",
  },
  single_file_support = true,
}
