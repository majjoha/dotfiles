-- Define signs for diagnostics
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "▍",
      [vim.diagnostic.severity.WARN] = "▍",
      [vim.diagnostic.severity.HINT] = "▍",
      [vim.diagnostic.severity.INFO] = "▍",
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
      [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
      [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
      [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
      [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
    },
  }
})

local servers = {
  elixirls = { cmd = { "/opt/homebrew/bin/elixir-ls" } },
  eslint = {},
  rust_analyzer = {},
}

for server, config in pairs(servers) do
  require("lspconfig")[server].setup(vim.tbl_deep_extend("force", {
    init_options = { documentFormatting = true },
    flags = { debounce_text_changes = 150 },
  }, config))
end
