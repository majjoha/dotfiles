-- Define signs for diagnostics
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "░",
      [vim.diagnostic.severity.WARN] = "░",
      [vim.diagnostic.severity.HINT] = "░",
      [vim.diagnostic.severity.INFO] = "░",
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
  },
  severity_sort = true,
})

local configurations = {}

for _, v in ipairs(vim.api.nvim_get_runtime_file("lsp/*", true)) do
  local name = vim.fn.fnamemodify(v, ":t:r")
  configurations[name] = true
end

vim.lsp.enable(vim.tbl_keys(configurations))
