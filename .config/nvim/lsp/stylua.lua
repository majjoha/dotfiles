return {
  cmd = {
    "stylua",
    "--config-path",
    vim.fn.expand("~/.dotfiles/.config/stylua/stylua.toml"),
    "--lsp",
  },
  filetypes = { "lua" },
  root_markers = { ".git" },
}
