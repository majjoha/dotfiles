local lspconfig = require("lspconfig")

local on_attach = function(client)
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

local languages = {
  javascript = {
    {
      formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}",
      formatStdin = true,
    },
  },
  json = { { formatCommand = "jq .", formatstdin = true } },
  lua = { { formatCommand = "lua-format -i", formatStdin = true } },
  sh = {
    {
      lintCommand = "shellcheck -f gcc -x -",
      lintSource = "shellcheck",
      lintStdin = true,
      lintFormats = { "%f:%l:%c: %t%*[^:]: %m [SC%n]" },
    },
    { formatCommand = "shfmt -ln bash -i 2 -bn -ci -sr -kp", formatStdin = true },
  },
  yaml = {
    {
      lintCommand = "yamllint --strict --format parsable ${INPUT}",
      lintStdin = false,
      lintFormats = { "%f:%l:%c: [%t%*[a-z]] %m" },
    },
  },
}

lspconfig.efm.setup({
  on_attach = on_attach,
  init_options = { documentFormatting = true },
  settings = { languages = languages, filetypes = vim.tbl_keys(languages) },
})

local servers = { "solargraph", "tsserver", "rust_analyzer" }

for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    init_options = { documentFormatting = true },
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
  }
end
