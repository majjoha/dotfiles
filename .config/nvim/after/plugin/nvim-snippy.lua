local snippy = require("snippy")

snippy.setup({
  mappings = {
    is = {
      ["<Tab>"] = "expand_or_advance",
      ["<A-Tab>"] = "previous",
    },
    nx = { ["<leader>z"] = "cut_text" },
  },
})
