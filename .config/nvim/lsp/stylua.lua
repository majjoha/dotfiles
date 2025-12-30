return {
  cmd = {
    "stylua",
    "--config-path",
    vim.fs.normalize(vim.fn.stdpath("config") .. "/../stylua/stylua.toml"),
    "--lsp",
  },
  filetypes = { "lua" },
  root_markers = { ".git" },
}
