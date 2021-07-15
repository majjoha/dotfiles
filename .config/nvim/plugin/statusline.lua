local show_git_branch = require("majjoha").show_git_branch

-- LuaFormatter off
vim.opt.statusline = table.concat({
  -- Show the current Git branch
  show_git_branch() .. " ",
  -- Show the name of the current file
  "%<%f ",
  -- Show modified flag
  "%-4m",
  -- Show readonly flag
  "%r",
  -- Align right
  "%=",
  -- Show the file type if any file type is set
  "%{strlen(&filetype)>0?&filetype.' | ':''}",
  -- Show the percentage through the file
  "%4.(%p%%%) ",
  -- Show line and column numbers
  "| %6.(%l:%c%) "
})
-- LuaFormatter on
