return {
  cmd = { "vscode-css-language-server", "--stdio" },
  init_options = { provideFormatter = true },
  root_markers = { "package.json", ".git" },
  filetypes = { "css", "scss", "less" },
  single_file_support = true,
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
}
