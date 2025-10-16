return {
  cmd = {
    "stylua",
    "--config-path",
    "~/.dotfiles/.config/stylua/stylua.toml",
    "--lsp",
  },
  filetypes = { "lua" },
  root_markers = { ".git" },
}
