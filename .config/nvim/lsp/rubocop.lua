return {
  cmd = { "rubocop", "--lsp" },
  cmd_env = { GEM_HOME = "" },
  root_markers = { "Gemfile", ".git" },
  filetypes = { "ruby" },
}
