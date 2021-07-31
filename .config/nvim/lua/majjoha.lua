local majjoha = {}

majjoha.open_current_as_new_tab = function()
  local current_pos = vim.fn.getcurpos()
  vim.cmd([[tabedit %]])
  vim.fn.setpos(".", current_pos)
end

majjoha.show_git_branch = function()
  local handle = io.popen(
                   "git branch --no-color 2>/dev/null | cut -b 3- | head -n 1 | tr -d '()'")
  local branchname = handle:read()
  handle:close()

  if branchname and string.len(branchname) > 0 then
    return "  " .. branchname .. " |"
  else
    return ""
  end
end

majjoha.customize_colors = function()
  vim.cmd([[
    " Highlight current line number, and set the background color to transparent
    hi! CursorLineNr ctermfg=13  ctermbg=00

    " Set the background color of the line numbers to transparent
    hi! LineNr ctermbg=00

    " Remove background color for fold column
    hi! link FoldColumn Normal

    " Set the color of the vertical split bar to transparent
    hi! VertSplit ctermbg=00

    " Show the current mode in a darker, non-bold font
    hi! ModeMsg ctermfg=08 cterm=NONE

    " Set the background of the status line in the current buffer to match the
    " color column, and the status line in all inactive buffers to transparent
    hi! StatusLine ctermbg=10
    hi! StatusLineNC ctermbg=00
  ]])
end

return majjoha
