require("mini.bracketed").setup({})

require("mini.comment").setup({
  mappings = {
    -- Toggle comment (like `gcip` - comment inner paragraph) for both
    -- Normal and Visual modes
    comment = "<Leader>/",
    -- Toggle comment on current line
    comment_line = "<Leader>/",
    -- Define "comment" textobject (like `dgc` - delete whole comment block)
    textobject = "gc",
  },
})

require("mini.files").setup(
  { windows = { preview = true, width_preview = 100 } })

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
  lsp_progress = {
    duration_last = 2000,
  }
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
