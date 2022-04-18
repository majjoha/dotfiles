local lspconfig = require("lspconfig")

local border = {
  { "┌", "FloatBorder" }, { "─", "FloatBorder" }, { "┐", "FloatBorder" },
  { "│", "FloatBorder" }, { "┘", "FloatBorder" }, { "─", "FloatBorder" },
  { "└", "FloatBorder" }, { "│", "FloatBorder" },
}

-- Use custom border on hover
vim.lsp.handlers["textDocument/hover"] =
  vim.lsp.with(vim.lsp.handlers.hover, { border = border })

-- Override `vim.lsp.util.open_floating_preview` function so it uses the custom
-- border instead
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Disable virtual text
vim.diagnostic.config({ virtual_text = false })

-- Define signs for diagnostics
vim.fn.sign_define("DiagnosticSignError", {
  text = "",
  texthl = "DiagnosticSignError",
  numhl = "DiagnosticSignError",
})

vim.fn.sign_define("DiagnosticSignWarn", {
  text = "",
  texthl = "DiagnosticSignWarn",
  numhl = "DiagnosticSignWarn",
})

vim.fn.sign_define("DiagnosticSignHint", {
  text = "",
  texthl = "DiagnosticSignHint",
  numhl = "DiagnosticSignHint",
})

vim.fn.sign_define("DiagnosticSignInfo", {
  text = "",
  texthl = "DiagnosticSignInfo",
  numhl = "DiagnosticSignInfo",
})

local on_attach = function(client, bufnr)
  -- Format files on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_augroup("LSPFormatting", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = vim.lsp.buf.formatting_seq_sync,
      group = "LSPFormatting",
    })
  end

  -- Enable completion through LSP servers
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

local servers = {
  bashls = {},
  efm = {},
  elixirls = { cmd = { "/opt/homebrew/bin/elixir-ls" } },
  hls = { settings = { formattingProvider = "stylish-haskell" } },
  rust_analyzer = {},
  solargraph = {},
  tsserver = {},
}

for server, config in pairs(servers) do
  lspconfig[server].setup(vim.tbl_deep_extend("force", {
    init_options = { documentFormatting = true },
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
  }, config))
end
