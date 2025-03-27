return {
  cmd = { "vscode-html-language-server", "--stdio" },
  init_options = {
    provideFormatter = true,
    embeddedLanguages = { css = true, javascript = true },
    configurationSection = { "html", "css", "javascript" },
  },
  root_markers = { "package.json", ".git" },
  filetypes = { "html", "templ" },
  single_file_support = true,
  settings = {},
}
