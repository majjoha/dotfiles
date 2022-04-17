-- LuaFormatter off
vim.opt.statusline = table.concat({
  -- Show the name of the current file
  " %<%f ",
  -- Show modified flag
  "%-4m",
  -- Show readonly flag
  "%r",
  -- Align right
  "%=",
  -- Show line and column numbers
  "%6.(%l:%c%) ",
  -- Show the percentage through the file
  "  %4.(%p%%%) "
})
-- LuaFormatter on
