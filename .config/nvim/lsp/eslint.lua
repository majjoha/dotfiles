return {
  cmd = { "vscode-eslint-language-server", "--stdio" },
  root_markers = {
    "babel.config.js",
    "tsconfig.json",
    "jsconfig.json",
    "package.json",
    ".git",
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
    "svelte",
    "astro",
  },
  settings = {
    validate = "on",
    packageManager = nil,
    useESLintClass = false,
    experimental = {
      useFlatConfig = false,
    },
    codeActionOnSave = {
      enable = false,
      mode = "all",
    },
    format = true,
    quiet = false,
    onIgnoredFiles = "off",
    rulesCustomizations = {},
    run = "onType",
    problems = {
      shortenToSingleLine = false,
    },
    -- `nodePath` configures the directory in which the `eslint` server should
    -- start its `node_modules` resolution.
    -- This path is relative to the workspace folder (root dir) of the server
    -- instance.
    nodePath = "",
    -- Use the workspace folder location or the file location (if no workspace
    -- folder is open) as the working directory
    workingDirectory = { mode = "auto" },
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = "separateLine",
      },
      showDocumentation = {
        enable = true,
      },
    },
  },
}
