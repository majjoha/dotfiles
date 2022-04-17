function show_git_branch()
  local branchname = vim.fn["fugitive#statusline"]()

  if string.len(branchname) > 0 then
    local formatted_branchname = string.sub(branchname, 6):sub(1, -3)
    return "   " .. formatted_branchname .. "  "
  else
    return " "
  end
end

-- LuaFormatter off
vim.opt.statusline = table.concat({
  -- Show the current Git branch
  "%{luaeval('show_git_branch()')}",
  -- Show the name of the current file
  "%<%f ",
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
