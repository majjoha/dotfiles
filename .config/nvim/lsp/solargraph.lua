return {
  cmd = { "solargraph", "stdio" },
  settings = {
    solargraph = {
      diagnostics = true,
    },
  },
  init_options = { formatting = true },
  root_markers = { ".git", "Gemfile" },
  filetypes = { "ruby" },
}
