local majjoha = {}

majjoha.open_current_as_new_tab = function()
  local current_pos = vim.fn.getcurpos()
  vim.cmd([[tabedit %]])
  vim.fn.setpos(".", current_pos)
end

majjoha.customize_colors = function()
  -- Highlight current line number, and set the background color to transparent
  vim.highlight.create("CursorLineNr", { ctermfg = 13, ctermbg = 00 })

  -- Set the background color of the line numbers to transparent
  vim.highlight.create("LineNr", { ctermbg = 00 })

  -- Remove background color for fold column
  vim.highlight.link("FoldColumn", "Normal")

  -- Set the color of the vertical split bar to transparent
  vim.highlight.create("VertSplit", { ctermbg = 00 })

  -- Show the current mode in a darker, non-bold font
  vim.highlight.create("ModeMsg", { ctermbg = 08, cterm = "NONE" })

  -- Set the background of the status line in the current buffer to match the
  -- color column, and the status line in all inactive buffers to transparent
  vim.highlight.create("StatusLine", { ctermbg = 10 })
  vim.highlight.create("StatusLineNC", { ctermbg = 00 })
end

return majjoha
