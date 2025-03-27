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
  bashls = {},
  cssls = {},
  efm = {},
  elixirls = { cmd = { "/opt/homebrew/bin/elixir-ls" } },
  erlangls = {},
  eslint = {},
  flow = {},
  gleam = {},
  harper_ls = {},
  hls = { settings = { formattingProvider = "stylish-haskell" } },
  html = {},
  jsonls = {},
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = {
          -- Get the language server to recognize the `vim` and `hs` globals
          globals = { "vim", "hs" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
            vim.api.nvim_get_runtime_file("", true),
            os.getenv("HOME") .. ".hammerspoon/Spoons/EmmyLua.spoon/annotations",
          },
        },
        -- Do not send telemetry data containing a randomized but unique
        -- identifier
        telemetry = { enable = false },
      },
    },
  },
  rust_analyzer = {},
  ts_ls = {},
}

for server, config in pairs(servers) do
  require("lspconfig")[server].setup(vim.tbl_deep_extend("force", {
    init_options = { documentFormatting = true },
    flags = { debounce_text_changes = 150 },
  }, config))
end
