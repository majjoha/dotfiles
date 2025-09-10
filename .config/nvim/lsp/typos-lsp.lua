return {
  cmd = { "typos-lsp" },
  init_options = { diagnosticSeverity = "Hint" },
  root_markers = {
    "typos.toml", "_typos.toml", ".typos.toml", "pyproject.toml", "Cargo.toml",
  },
  settings = {},
}
