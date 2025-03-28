require("mini.bracketed").setup({})

require("mini.files").setup({
  mappings = {
    go_in = "<Tab>",
    go_in_plus = "<CR>",
    go_out = "<S-Tab>",
    go_out_plus = nil,
  },
  windows = { preview = true, width_preview = 100 },
})

require("mini.icons").setup({})

require("mini.notify").setup({
  content = {
    -- Sort notifications by oldest first
    sort = function(notif_arr)
      table.sort(notif_arr, function(a, b)
        return a.ts_update < b.ts_update
      end)
      return notif_arr
    end,
  },
  lsp_progress = { duration_last = 2000 },
  window = {
    -- Show the notifications in the bottom right corner
    config = {
      border = "single",
      anchor = "SE",
      col = vim.o.columns,
      row = vim.o.lines - (vim.o.cmdheight + 1),
    },
  },
})

require("mini.pairs").setup()

require("mini.surround").setup({
  mappings = { add = "ys", delete = "ds", replace = "cs" },
  custom_surroundings = {
    ["("] = { output = { left = "( ", right = " )" } },
    ["["] = { output = { left = "[ ", right = " ]" } },
    ["{"] = { output = { left = "{ ", right = " }" } },
    ["<"] = { output = { left = "< ", right = " >" } },
  },
})
