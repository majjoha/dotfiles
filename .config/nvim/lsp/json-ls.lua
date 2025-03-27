return {
  cmd = { "vscode-json-language-server", "--stdio" },
  init_options = { provideFormatter = true },
  root_markers = { ".git" },
  filetypes = { "json", "jsonc" },
  single_file_support = true,
}
