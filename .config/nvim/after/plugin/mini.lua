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