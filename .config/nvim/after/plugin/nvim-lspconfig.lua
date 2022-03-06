local lspconfig = require("lspconfig")

local on_attach = function(client)
  -- Enable completion through LSP servers
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  if client.resolved_capabilities.document_formatting then
    local autocmd = [[
      augroup lsp_formatting
        autocmd!
        autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_seq_sync()
      augroup END
    ]]

    vim.cmd(autocmd)
  end
end

lspconfig.elixirls.setup({
  on_attach = on_attach,
  init_options = { documentFormatting = true },
  cmd = { "/opt/homebrew/bin/elixir-ls" },
})

local servers = { "efm", "solargraph", "tsserver", "rust_analyzer" }

for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    init_options = { documentFormatting = true },
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
  }
end
