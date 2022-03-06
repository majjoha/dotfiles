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

local on_attach = function(client)
  -- Enable completion through LSP servers
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Format files on save
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
