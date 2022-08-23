local majjoha = {}

majjoha.customize_colors = function()
  -- Set the background color of the line numbers to transparent
  vim.highlight.create("LineNr", { ctermbg = 00 })

  -- Remove background color for fold column
  vim.highlight.link("FoldColumn", "Normal")

  -- Set the color of the vertical split bar to transparent
  vim.highlight.create("VertSplit", { ctermbg = 00 })

  -- Show the current mode in a darker, non-bold font
  vim.highlight.create("ModeMsg", { ctermfg = 08, cterm = "NONE" })

  -- Set the background of the status line in the current buffer to match the
  -- color column, and the status line in all inactive buffers to transparent
  vim.highlight.create("StatusLine", { ctermbg = 10, ctermfg = 07 })
  vim.highlight.create("StatusLineNC", { ctermbg = 10, ctermfg = 08 })

  -- Set the sign column to have a transparent background and define the
  -- foreground colors for the various signs
  vim.highlight.create("SignColumn", { ctermbg = 00 })
  vim.highlight.create("DiagnosticSignError", { ctermfg = 01, ctermbg = 00 })
  vim.highlight.create("DiagnosticSignWarn", { ctermfg = 03, ctermbg = 00 })
  vim.highlight.create("DiagnosticSignHint", { ctermfg = 07, ctermbg = 00 })
  vim.highlight.create("DiagnosticSignInfo", { ctermfg = 07, ctermbg = 00 })

  -- Define colors for floating windows
  vim.highlight.create("NormalFloat", { ctermbg = 00 })
  vim.highlight.create("FloatBorder", { ctermbg = 00 })

  -- Hide status line for NvimTree buffer
  vim.highlight.create("NvimTreeStatusLineNC", { ctermbg = 00, ctermfg = 00 })
  vim.highlight.create("NvimTreeStatusLine", { ctermbg = 00, ctermfg = 00 })
end

return majjoha
