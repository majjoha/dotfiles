-- Disable virtual text
vim.diagnostic.config({ virtual_text = false })

-- Define signs for diagnostics
vim.fn.sign_define("DiagnosticSignError", {
  text = "▍",
  texthl = "DiagnosticSignError",
  numhl = "DiagnosticSignError",
})

vim.fn.sign_define("DiagnosticSignWarn", {
  text = "▍",
  texthl = "DiagnosticSignWarn",
  numhl = "DiagnosticSignWarn",
})

vim.fn.sign_define("DiagnosticSignHint", {
  text = "▍",
  texthl = "DiagnosticSignHint",
  numhl = "DiagnosticSignHint",
})

vim.fn.sign_define("DiagnosticSignInfo", {
  text = "▍",
  texthl = "DiagnosticSignInfo",
  numhl = "DiagnosticSignInfo",
})

local servers = {
  bashls = {},
  efm = {},
  elixirls = { cmd = { "/opt/homebrew/bin/elixir-ls" } },
  erlangls = {},
  eslint = {},
  flow = {},
  gleam = {},
  hls = { settings = { formattingProvider = "stylish-haskell" } },
  marksman = {},
  rubocop = {},
  ruby_lsp = {},
  rust_analyzer = {},
  solargraph = {},
  tsserver = { filetypes = { "typescript", "typescriptreact", "typescript.tsx" } },
}

for server, config in pairs(servers) do
  require("lspconfig")[server].setup(vim.tbl_deep_extend("force", {
    init_options = { documentFormatting = true },
    flags = { debounce_text_changes = 150 },
  }, config))
end
