return {
  cmd = { "ruby-lsp" },
  cmd_env = { GEM_HOME = "" },
  init_options = { formatter = "auto" },
  root_markers = { ".git", "Gemfile" },
  filetypes = { "ruby", "eruby" },
  single_file_support = true,
}
