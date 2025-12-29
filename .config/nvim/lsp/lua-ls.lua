return {
  cmd = { "lua-language-server" },
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git",
  },
  filetypes = { "lua" },
  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = {
        -- Get the language server to recognize the `vim` and `hs` globals
        globals = { "vim", "hs" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.tbl_flatten({
          vim.api.nvim_get_runtime_file("", true),
          os.getenv("HOME") .. "/.hammerspoon/Spoons/EmmyLua.spoon/annotations",
        }),
      },
      -- Do not send telemetry data containing a randomized but unique
      -- identifier
      telemetry = { enable = false },
    },
  },
}
