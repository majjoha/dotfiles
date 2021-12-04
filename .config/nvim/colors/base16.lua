-- Modified version of https://github.com/wincent/base16-nvim/blob/main/colors/base16-default-dark.lua
local gui00 = "181818"
local gui01 = "282828"
local gui02 = "383838"
local gui03 = "585858"
local gui04 = "b8b8b8"
local gui05 = "d8d8d8"
local gui06 = "e8e8e8"
local gui07 = "f8f8f8"
local gui08 = "ab4642"
local gui09 = "dc9656"
local gui0A = "f7ca88"
local gui0B = "a1b56c"
local gui0C = "86c1b9"
local gui0D = "7cafc2"
local gui0E = "ba8baf"
local gui0F = "a16946"

local cterm00 = "00"
local cterm03 = "08"
local cterm05 = "07"
local cterm07 = "15"
local cterm08 = "01"
local cterm0A = "03"
local cterm0B = "02"
local cterm0C = "06"
local cterm0D = "04"
local cterm0E = "05"
local cterm01 = "10"
local cterm02 = "11"
local cterm04 = "12"
local cterm06 = "13"
local cterm09 = "09"
local cterm0F = "14"

vim.cmd([[
  highlight clear
  syntax reset
]])
vim.g.colors_name = "base16"

-- Vim editor colors
vim.highlight.create("Bold", { gui = "bold", cterm = "bold" })

vim.highlight.create("ColorColumn", {
  guibg = gui01,
  ctermbg = cterm01,
  gui = "none",
  cterm = "none",
})

vim.highlight.create("Conceal", {
  guifg = gui0D,
  guibg = gui00,
  ctermfg = cterm0D,
  ctermbg = cterm00,
})

vim.highlight.create("Cursor", {
  guifg = gui00,
  guibg = gui05,
  ctermfg = cterm00,
  ctermbg = cterm05,
})

vim.highlight.create("CursorColumn", {
  guibg = gui01,
  ctermbg = cterm01,
  gui = "none",
  cterm = "none",
})

vim.highlight.create("CursorLine", {
  guibg = gui01,
  ctermbg = cterm01,
  gui = "none",
  cterm = "none",
})

vim.highlight.create("CursorLineNr", {
  guifg = gui03,
  guibg = gui01,
  ctermfg = cterm03,
  ctermbg = cterm01,
})

vim.highlight.create("Debug", { guifg = gui08, ctermfg = cterm08 })

vim.highlight.create("Directory", { guifg = gui0D, ctermfg = cterm0D })

vim.highlight.create("Error", {
  guifg = gui00,
  guibg = gui08,
  ctermfg = cterm00,
  ctermbg = cterm08,
})

vim.highlight.create("ErrorMsg", {
  guifg = gui08,
  guibg = gui00,
  ctermfg = cterm08,
  ctermbg = cterm00,
})

vim.highlight.create("Exception", { guifg = gui08, ctermfg = cterm08 })

vim.highlight.create("FoldColumn", { guibg = gui01, ctermbg = cterm01 })

vim.highlight.create("Folded", {
  guifg = gui03,
  guibg = gui01,
  ctermfg = cterm03,
  ctermbg = cterm01,
})

vim.highlight.create("IncSearch", {
  guifg = gui01,
  guibg = gui09,
  ctermfg = cterm01,
  ctermbg = cterm09,
  gui = "none",
  cterm = "none",
})

vim.highlight.create("Italic", { gui = "none", cterm = "none" })

vim.highlight.create("LineNr", {
  guifg = gui03,
  guibg = gui01,
  ctermfg = cterm03,
  ctermbg = cterm01,
})

vim.highlight.create("Macro", { guifg = gui08, ctermfg = cterm08 })

vim.highlight.create("MatchParen", {
  guifg = gui00,
  guibg = gui03,
  ctermfg = cterm00,
  ctermbg = cterm03,
})

vim.highlight.create("ModeMsg", { guifg = gui0B, ctermfg = cterm0B })

vim.highlight.create("MoreMsg", { guifg = gui0B, ctermfg = cterm0B })

vim.highlight.create("NonText", { guifg = gui03, ctermfg = cterm03 })

vim.highlight.create("Normal", {
  guifg = gui05,
  guibg = gui00,
  ctermfg = cterm05,
  ctermbg = cterm00,
})

vim.highlight.create("PMenu", {
  guifg = gui04,
  guibg = gui01,
  ctermfg = cterm04,
  ctermbg = cterm01,
})

vim.highlight.create("PMenuSel", {
  guifg = gui01,
  guibg = gui04,
  ctermfg = cterm01,
  ctermbg = cterm04,
})

vim.highlight.create("Question", { guifg = gui0D, ctermfg = cterm0D })

vim.highlight.create("QuickFixLine", {
  guibg = gui01,
  ctermbg = cterm01,
  gui = "none",
  cterm = "none",
})

vim.highlight.create("Search", {
  guifg = gui03,
  guibg = gui0A,
  ctermfg = cterm03,
  ctermbg = cterm0A,
})

vim.highlight.create("SignColumn", {
  guifg = gui03,
  guibg = gui01,
  ctermfg = cterm03,
  ctermbg = cterm01,
})

vim.highlight.create("SpecialKey", { guifg = gui03, ctermfg = cterm03 })

vim.highlight.create("StatusLine", {
  guifg = gui04,
  guibg = gui02,
  ctermfg = cterm04,
  ctermbg = cterm02,
  gui = "none",
  cterm = "none",
})

vim.highlight.create("StatusLineNC", {
  guifg = gui03,
  guibg = gui01,
  ctermfg = cterm03,
  ctermbg = cterm01,
  gui = "none",
  cterm = "none",
})

vim.highlight.create("Substitute", {
  guifg = gui01,
  guibg = gui0A,
  ctermfg = cterm01,
  ctermbg = cterm0A,
  gui = "none",
  cterm = "none",
})

vim.highlight.create("TabLine", {
  guifg = gui03,
  guibg = gui01,
  ctermfg = cterm03,
  ctermbg = cterm01,
  gui = "none",
  cterm = "none",
})

vim.highlight.create("TabLineFill", {
  guifg = gui03,
  guibg = gui01,
  ctermfg = cterm03,
  ctermbg = cterm01,
  gui = "none",
  cterm = "none",
})

vim.highlight.create("TabLineSel", {
  guifg = gui0B,
  guibg = gui01,
  ctermfg = cterm0B,
  ctermbg = cterm01,
  gui = "none",
  cterm = "none",
})

vim.highlight.create("Title", {
  guifg = gui0D,
  ctermfg = cterm0D,
  gui = "none",
  cterm = "none",
})

vim.highlight.create("TooLong", { guifg = gui08, ctermfg = cterm08 })

vim.highlight.create("Underlined", { guifg = gui08, ctermfg = cterm08 })

vim.highlight.create("VertSplit", {
  guifg = gui02,
  guibg = gui02,
  ctermfg = cterm02,
  ctermbg = cterm02,
  gui = "none",
  cterm = "none",
})

vim.highlight.create("Visual", { guibg = gui02, ctermbg = cterm02 })

vim.highlight.create("VisualNOS", { guifg = gui08, ctermfg = cterm08 })

vim.highlight.create("WarningMsg", { guifg = gui08, ctermfg = cterm08 })

vim.highlight.create("WildMenu",
                     { guifg = gui08, guibg = gui0A, ctermfg = cterm08 })

-- Standard syntax highlighting
vim.highlight.create("Boolean", { guifg = gui09, ctermfg = cterm09 })

vim.highlight.create("Character", { guifg = gui08, ctermfg = cterm08 })

vim.highlight.create("Comment", { guifg = gui03, ctermfg = cterm03 })

vim.highlight.create("Conditional", { guifg = gui0E, ctermfg = cterm0E })

vim.highlight.create("Constant", { guifg = gui09, ctermfg = cterm09 })

vim.highlight.create("Define", {
  guifg = gui0E,
  ctermfg = cterm0E,
  gui = "none",
  cterm = "none",
})

vim.highlight.create("Delimiter", { guifg = gui0F, ctermfg = cterm0F })

vim.highlight.create("Float", { guifg = gui09, ctermfg = cterm09 })

vim.highlight.create("Function", { guifg = gui0D, ctermfg = cterm0D })

vim.highlight.create("Identifier", {
  guifg = gui08,
  ctermfg = cterm08,
  gui = "none",
  cterm = "none",
})

vim.highlight.create("Include", { guifg = gui0D, ctermfg = cterm0D })

vim.highlight.create("Keyword", { guifg = gui0E, ctermfg = cterm0E })

vim.highlight.create("Label", { guifg = gui0A, ctermfg = cterm0A })

vim.highlight.create("Number", { guifg = gui09, ctermfg = cterm09 })

vim.highlight.create("Operator", {
  guifg = gui05,
  ctermfg = cterm05,
  gui = "none",
  cterm = "none",
})

vim.highlight.create("PreProc", { guifg = gui0A, ctermfg = cterm0A })

vim.highlight.create("Repeat", { guifg = gui0A, ctermfg = cterm0A })

vim.highlight.create("Special", { guifg = gui0C, ctermfg = cterm0C })

vim.highlight.create("SpecialChar", { guifg = gui0F, ctermfg = cterm0F })

vim.highlight.create("Statement", { guifg = gui08, ctermfg = cterm08 })

vim.highlight.create("StorageClass", { guifg = gui0A, ctermfg = cterm0A })

vim.highlight.create("String", { guifg = gui0B, ctermfg = cterm0B })

vim.highlight.create("Structure", { guifg = gui0E, ctermfg = cterm0E })

vim.highlight.create("Tag", { guifg = gui0A, ctermfg = cterm0A })

vim.highlight.create("Todo", {
  guifg = gui0A,
  guibg = gui01,
  ctermfg = cterm0A,
  ctermbg = cterm01,
})

vim.highlight.create("Type", {
  guifg = gui0A,
  ctermfg = cterm0A,
  gui = "none",
  cterm = "none",
})

vim.highlight.create("Typedef", { guifg = gui0A, ctermfg = cterm0A })

-- C highlighting
vim.highlight.create("cOperator", { guifg = gui0C, ctermfg = cterm0C })

vim.highlight.create("cPreCondit", { guifg = gui0E, ctermfg = cterm0E })

-- C# highlighting
vim.highlight.create("csClass", { guifg = gui0A, ctermfg = cterm0A })

vim.highlight.create("csAttribute", { guifg = gui0A, ctermfg = cterm0A })

vim.highlight.create("csModifier", { guifg = gui0E, ctermfg = cterm0E })

vim.highlight.create("csType", { guifg = gui08, ctermfg = cterm08 })

vim.highlight.create("csUnspecifiedStatement",
                     { guifg = gui0D, ctermfg = cterm0D })

vim.highlight.create("csContextualStatement",
                     { guifg = gui0E, ctermfg = cterm0E })

vim.highlight.create("csNewDecleration", { guifg = gui08, ctermfg = cterm08 })

-- CSS highlighting
vim.highlight.create("cssBraces", { guifg = gui05, ctermfg = cterm05 })

vim.highlight.create("cssClassName", { guifg = gui0E, ctermfg = cterm0E })

vim.highlight.create("cssColor", { guifg = gui0C, ctermfg = cterm0C })

-- Diff highlighting
vim.highlight.create("DiffAdd", {
  guifg = gui0B,
  guibg = gui01,
  ctermfg = cterm0B,
  ctermbg = cterm01,
})

vim.highlight.create("DiffChange", {
  guifg = gui03,
  guibg = gui01,
  ctermfg = cterm03,
  ctermbg = cterm01,
})

vim.highlight.create("DiffDelete", {
  guifg = gui08,
  guibg = gui01,
  ctermfg = cterm08,
  ctermbg = cterm01,
})

vim.highlight.create("DiffText", {
  guifg = gui0D,
  guibg = gui01,
  ctermfg = cterm0D,
  ctermbg = cterm01,
})

vim.highlight.create("DiffAdded", {
  guifg = gui0B,
  guibg = gui00,
  ctermfg = cterm0B,
  ctermbg = cterm00,
})

vim.highlight.create("DiffFile", {
  guifg = gui08,
  guibg = gui00,
  ctermfg = cterm08,
  ctermbg = cterm00,
})

vim.highlight.create("DiffNewFile", {
  guifg = gui0B,
  guibg = gui00,
  ctermfg = cterm0B,
  ctermbg = cterm00,
})

vim.highlight.create("DiffLine", {
  guifg = gui0D,
  guibg = gui00,
  ctermfg = cterm0D,
  ctermbg = cterm00,
})

vim.highlight.create("DiffRemoved", {
  guifg = gui08,
  guibg = gui00,
  ctermfg = cterm08,
  ctermbg = cterm00,
})

-- Git highlighting
vim.highlight.create("gitcommitOverflow", { guifg = gui08, ctermfg = cterm08 })

vim.highlight.create("gitcommitSummary", { guifg = gui0B, ctermfg = cterm0B })

vim.highlight.create("gitcommitComment", { guifg = gui03, ctermfg = cterm03 })

vim.highlight.create("gitcommitUntracked", { guifg = gui03, ctermfg = cterm03 })

vim.highlight.create("gitcommitDiscarded", { guifg = gui03, ctermfg = cterm03 })

vim.highlight.create("gitcommitSelected", { guifg = gui03, ctermfg = cterm03 })

vim.highlight.create("gitcommitHeader", { guifg = gui0E, ctermfg = cterm0E })

vim.highlight.create("gitcommitSelectedType",
                     { guifg = gui0D, ctermfg = cterm0D })

vim.highlight.create("gitcommitUnmergedType",
                     { guifg = gui0D, ctermfg = cterm0D })

vim.highlight.create("gitcommitDiscardedType",
                     { guifg = gui0D, ctermfg = cterm0D })

vim.highlight.create("gitcommitBranch", {
  guifg = gui09,
  ctermfg = cterm09,
  gui = "bold",
  cterm = "bold",
})

vim.highlight.create("gitcommitUntrackedFile",
                     { guifg = gui0A, ctermfg = cterm0A })

vim.highlight.create("gitcommitUnmergedFile", {
  guifg = gui08,
  ctermfg = cterm08,
  gui = "bold",
  cterm = "bold",
})

vim.highlight.create("gitcommitDiscardedFile", {
  guifg = gui08,
  ctermfg = cterm08,
  gui = "bold",
  cterm = "bold",
})

vim.highlight.create("gitcommitSelectedFile", {
  guifg = gui0B,
  ctermfg = cterm0B,
  gui = "bold",
  cterm = "bold",
})

-- HTML highlighting
vim.highlight.create("htmlBold", { guifg = gui0A, ctermfg = cterm0A })

vim.highlight.create("htmlItalic", { guifg = gui0E, ctermfg = cterm0E })

vim.highlight.create("htmlEndTag", { guifg = gui05, ctermfg = cterm05 })

vim.highlight.create("htmlTag", { guifg = gui05, ctermfg = cterm05 })

-- JavaScript highlighting
vim.highlight.create("javaScript", { guifg = gui05, ctermfg = cterm05 })

vim.highlight.create("javaScriptBraces", { guifg = gui05, ctermfg = cterm05 })

vim.highlight.create("javaScriptNumber", { guifg = gui09, ctermfg = cterm09 })

-- pangloss/vim-javascript highlighting
vim.highlight.create("jsOperator", { guifg = gui0D, ctermfg = cterm0D })

vim.highlight.create("jsStatement", { guifg = gui0E, ctermfg = cterm0E })

vim.highlight.create("jsReturn", { guifg = gui0E, ctermfg = cterm0E })

vim.highlight.create("jsThis", { guifg = gui08, ctermfg = cterm08 })

vim.highlight.create("jsClassDefinition", { guifg = gui0A, ctermfg = cterm0A })

vim.highlight.create("jsFunction", { guifg = gui0E, ctermfg = cterm0E })

vim.highlight.create("jsFuncName", { guifg = gui0D, ctermfg = cterm0D })

vim.highlight.create("jsFuncCall", { guifg = gui0D, ctermfg = cterm0D })

vim.highlight.create("jsClassFuncName", { guifg = gui0D, ctermfg = cterm0D })

vim.highlight.create("jsClassMethodType", { guifg = gui0E, ctermfg = cterm0E })

vim.highlight.create("jsRegexpString", { guifg = gui0C, ctermfg = cterm0C })

vim.highlight.create("jsGlobalObjects", { guifg = gui0A, ctermfg = cterm0A })

vim.highlight
  .create("jsGlobalNodeObjects", { guifg = gui0A, ctermfg = cterm0A })

vim.highlight.create("jsExceptions", { guifg = gui0A, ctermfg = cterm0A })

vim.highlight.create("jsBuiltins", { guifg = gui0A, ctermfg = cterm0A })

-- Mail highlighting
vim.highlight.create("mailQuoted1", { guifg = gui0A, ctermfg = cterm0A })

vim.highlight.create("mailQuoted2", { guifg = gui0B, ctermfg = cterm0B })

vim.highlight.create("mailQuoted3", { guifg = gui0E, ctermfg = cterm0E })

vim.highlight.create("mailQuoted4", { guifg = gui0C, ctermfg = cterm0C })

vim.highlight.create("mailQuoted5", { guifg = gui0D, ctermfg = cterm0D })

vim.highlight.create("mailQuoted6", { guifg = gui0A, ctermfg = cterm0A })

vim.highlight.create("mailURL", { guifg = gui0D, ctermfg = cterm0D })

vim.highlight.create("mailEmail", { guifg = gui0D, ctermfg = cterm0D })

-- Markdown highlighting
vim.highlight.create("markdownCode", { guifg = gui0B, ctermfg = cterm0B })

vim.highlight.create("markdownError", {
  guifg = gui05,
  guibg = gui00,
  ctermfg = cterm05,
  ctermbg = cterm00,
})

vim.highlight.create("markdownCodeBlock", { guifg = gui0B, ctermfg = cterm0B })

vim.highlight.create("markdownHeadingDelimiter",
                     { guifg = gui0D, ctermfg = cterm0D })

-- NERDTree highlighting
vim.highlight.create("NERDTreeDirSlash", { guifg = gui0D, ctermfg = cterm0D })

vim.highlight.create("NERDTreeExecFile", { guifg = gui05, ctermfg = cterm05 })

-- PHP highlighting
vim.highlight.create("phpMemberSelector", { guifg = gui05, ctermfg = cterm05 })

vim.highlight.create("phpComparison", { guifg = gui05, ctermfg = cterm05 })

vim.highlight.create("phpParent", { guifg = gui05, ctermfg = cterm05 })

vim.highlight.create("phpMethodsVar", { guifg = gui0C, ctermfg = cterm0C })

-- Python highlighting
vim.highlight.create("pythonOperator", { guifg = gui0E, ctermfg = cterm0E })

vim.highlight.create("pythonRepeat", { guifg = gui0E, ctermfg = cterm0E })

vim.highlight.create("pythonInclude", { guifg = gui0E, ctermfg = cterm0E })

vim.highlight.create("pythonStatement", { guifg = gui0E, ctermfg = cterm0E })

-- Ruby highlighting
vim.highlight.create("rubyAttribute", { guifg = gui0D, ctermfg = cterm0D })

vim.highlight.create("rubyConstant", { guifg = gui0A, ctermfg = cterm0A })

vim.highlight.create("rubyInterpolation", { guifg = gui0B, ctermfg = cterm0B })

vim.highlight.create("rubyInterpolationDelimiter",
                     { guifg = gui0F, ctermfg = cterm0F })

vim.highlight.create("rubyRegexp", { guifg = gui0C, ctermfg = cterm0C })

vim.highlight.create("rubySymbol", { guifg = gui0B, ctermfg = cterm0B })

vim.highlight
  .create("rubyStringDelimiter", { guifg = gui0B, ctermfg = cterm0B })

-- SASS highlighting
vim.highlight.create("sassidChar", { guifg = gui08, ctermfg = cterm08 })

vim.highlight.create("sassClassChar", { guifg = gui09, ctermfg = cterm09 })

vim.highlight.create("sassInclude", { guifg = gui0E, ctermfg = cterm0E })

vim.highlight.create("sassMixing", { guifg = gui0E, ctermfg = cterm0E })

vim.highlight.create("sassMixinName", { guifg = gui0D, ctermfg = cterm0D })

-- Spelling highlighting
vim.highlight.create("SpellBad", {
  guibg = gui00,
  ctermbg = cterm00,
  gui = "undercurl",
  cterm = "undercurl",
})

vim.highlight.create("SpellLocal", {
  guibg = gui00,
  ctermbg = cterm00,
  gui = "undercurl",
  cterm = "undercurl",
})

vim.highlight.create("SpellCap", {
  guibg = gui00,
  ctermbg = cterm00,
  gui = "undercurl",
  cterm = "undercurl",
})

vim.highlight.create("SpellRare", {
  guibg = gui00,
  ctermbg = cterm00,
  gui = "undercurl",
  cterm = "undercurl",
})

-- Java highlighting
vim.highlight.create("javaOperator", { guifg = gui0D, ctermfg = cterm0D })
