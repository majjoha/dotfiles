return {
  cmd = { "graphql-lsp", "server", "-m", "stream" },
  filetypes = {
    "graphql",
    "typescript",
    "typescriptreact",
    "javascriptreact",
  },
  root_markers = {
    ".graphqlrc*",
    ".graphql.config.*",
    "graphql.config.*",
    ".git",
    "package.json",
  },
}
