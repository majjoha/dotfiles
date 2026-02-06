local gui00 = "#181818"
local gui01 = "#282828"
local gui02 = "#383838"
local gui03 = "#585858"
local gui04 = "#b8b8b8"
local gui05 = "#d8d8d8"
local gui06 = "#e8e8e8"
local gui07 = "#f8f8f8"
local gui08 = "#ab4642"
local gui09 = "#dc9656"
local gui0A = "#f7ca88"
local gui0B = "#a1b56c"
local gui0C = "#86c1b9"
local gui0D = "#7cafc2"
local gui0E = "#ba8baf"
local gui0F = "#a16946"

local cterm00 = 00
local cterm03 = 08
local cterm05 = 07
local cterm07 = 15
local cterm08 = 01
local cterm0A = 03
local cterm0B = 02
local cterm0C = 06
local cterm0D = 04
local cterm0E = 05
local cterm01 = 10
local cterm02 = 11
local cterm04 = 12
local cterm06 = 13
local cterm09 = 09
local cterm0F = 14

vim.cmd([[
  highlight clear
  syntax reset
]])
vim.g.colors_name = "base16"

for group, settings in pairs({
  -- Vim editor colors
  Bold = {
    bold = true
  },
  ColorColumn = {
    bg = gui01,
    ctermbg = cterm01,
  },
  Conceal = {
    fg = gui0D,
    bg = gui00,
    ctermfg = cterm0D,
    ctermbg = cterm00,
  },
  Cursor = {
    fg = gui00,
    bg = gui05,
    ctermfg = cterm00,
    ctermbg = cterm05,
  },
  CursorColumn = {
    bg = gui01,
    ctermbg = cterm01,
  },
  CursorLine = {
    bg = gui01,
    ctermbg = cterm01,
  },
  CursorLineNr = {
    fg = gui03,
    bg = gui01,
    ctermfg = cterm03,
    ctermbg = cterm01,
  },
  Debug = {
    fg = gui08,
    ctermfg = cterm08,
  },
  Directory = {
    fg = gui0D,
    ctermfg = cterm0D,
  },
  Error = {
    fg = gui00,
    bg = gui08,
    ctermfg = cterm00,
    ctermbg = cterm08,
  },
  ErrorMsg = {
    fg = gui08,
    bg = gui00,
    ctermfg = cterm08,
    ctermbg = cterm00,
  },
  Exception = {
    fg = gui08,
    ctermfg = cterm08,
  },
  FoldColumn = {
    fg = gui0C,
    bg = gui01,
    ctermfg = cterm0C,
    ctermbg = cterm01,
  },
  Folded = {
    fg = gui03,
    bg = gui01,
    ctermfg = cterm03,
    ctermbg = cterm01,
  },
  IncSearch = {
    fg = gui01,
    bg = gui09,
    ctermfg = cterm01,
    ctermbg = cterm09,
  },
  Italic = {
  },
  LineNr = {
    fg = gui03,
    bg = gui01,
    ctermfg = cterm03,
    ctermbg = cterm01,
  },
  Macro = {
    fg = gui08,
    ctermfg = cterm08,
  },
  MatchParen = {
    bg = gui03,
    ctermbg = cterm03,
  },
  ModeMsg = {
    fg = gui0B,
    ctermfg = cterm0B,
  },
  MoreMsg = {
    fg = gui0B,
    ctermfg = cterm0B,
  },
  NonText = {
    fg = gui03,
    ctermfg = cterm03,
  },
  Normal = {
    fg = gui05,
    bg = gui00,
    ctermfg = cterm05,
    ctermbg = cterm00,
  },
  PMenu = {
    fg = gui05,
    bg = gui01,
    ctermfg = cterm05,
    ctermbg = cterm01,
  },
  PMenuSel = {
    fg = gui01,
    bg = gui05,
    ctermfg = cterm01,
    ctermbg = cterm05,
  },
  Question = {
    fg = gui0D,
    ctermfg = cterm0D,
  },
  QuickFixLine = {
    bg = gui01,
    ctermbg = cterm01,
  },
  Search = {
    fg = gui01,
    bg = gui0A,
    ctermfg = cterm01,
    ctermbg = cterm0A,
  },
  SignColumn = {
    fg = gui03,
    bg = gui01,
    ctermfg = cterm03,
    ctermbg = cterm01,
  },
  SpecialKey = {
    fg = gui03,
    ctermfg = cterm03,
  },
  StatusLine = {
    fg = gui04,
    bg = gui02,
    ctermfg = cterm04,
    ctermbg = cterm02,
  },
  StatusLineNC = {
    fg = gui03,
    bg = gui01,
    ctermfg = cterm03,
    ctermbg = cterm01,
  },
  Substitute = {
    fg = gui01,
    bg = gui0A,
    ctermfg = cterm01,
    ctermbg = cterm0A,
  },
  TabLine = {
    fg = gui03,
    bg = gui01,
    ctermfg = cterm03,
    ctermbg = cterm01,
  },
  TabLineFill = {
    fg = gui03,
    bg = gui01,
    ctermfg = cterm03,
    ctermbg = cterm01,
  },
  TabLineSel = {
    fg = gui0B,
    bg = gui01,
    ctermfg = cterm0B,
    ctermbg = cterm01,
  },
  Title = {
    fg = gui0D,
    ctermfg = cterm0D,
  },
  TooLong = {
    fg = gui08,
    ctermfg = cterm08,
  },
  Underlined = {
    fg = gui08,
    ctermfg = cterm08,
  },
  VertSplit = {
    fg = gui02,
    bg = gui02,
    ctermfg = cterm02,
    ctermbg = cterm02,
  },
  Visual = {
    bg = gui02,
    ctermbg = cterm02,
  },
  VisualNOS = {
    fg = gui08,
    ctermfg = cterm08,
  },
  WarningMsg = {
    fg = gui08,
    ctermfg = cterm08,
  },
  WildMenu = {
    fg = gui08,
    bg = gui0A,
    ctermfg = cterm08,
  },

  -- Standard syntax highlighting
  Boolean = {
    fg = gui09,
    ctermfg = cterm09,
  },
  Character = {
    fg = gui08,
    ctermfg = cterm08,
  },
  Comment = {
    fg = gui03,
    ctermfg = cterm03,
  },
  Conditional = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  Constant = {
    fg = gui09,
    ctermfg = cterm09,
  },
  Define = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  Delimiter = {
    fg = gui0F,
    ctermfg = cterm0F,
  },
  Float = {
    fg = gui09,
    ctermfg = cterm09,
  },
  Function = {
    fg = gui0D,
    ctermfg = cterm0D,
  },
  Identifier = {
    fg = gui08,
    ctermfg = cterm08,
  },
  Include = {
    fg = gui0D,
    ctermfg = cterm0D,
  },
  Keyword = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  Label = {
    fg = gui0A,
    ctermfg = cterm0A,
  },
  Number = {
    fg = gui09,
    ctermfg = cterm09,
  },
  Operator = {
    fg = gui05,
    ctermfg = cterm05,
  },
  PreProc = {
    fg = gui0A,
    ctermfg = cterm0A,
  },
  Repeat = {
    fg = gui0A,
    ctermfg = cterm0A,
  },
  Special = {
    fg = gui0C,
    ctermfg = cterm0C,
  },
  SpecialChar = {
    fg = gui0F,
    ctermfg = cterm0F,
  },
  Statement = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  StorageClass = {
    fg = gui0A,
    ctermfg = cterm0A,
  },
  String = {
    fg = gui0B,
    ctermfg = cterm0B,
  },
  Structure = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  Tag = {
    fg = gui0A,
    ctermfg = cterm0A,
  },
  Todo = {
    fg = gui0A,
    bg = gui01,
    ctermfg = cterm0A,
    ctermbg = cterm01,
  },
  Type = {
    fg = gui0A,
    ctermfg = cterm0A,
  },
  Typedef = {
    fg = gui0A,
    ctermfg = cterm0A,
  },

  -- C highlighting
  cOperator = {
    fg = gui0C,
    ctermfg = cterm0C,
  },
  cPreCondit = {
    fg = gui0E,
    ctermfg = cterm0E,
  },

  -- C# highlighting
  csClass = {
    fg = gui0A,
    ctermfg = cterm0A,
  },
  csAttribute = {
    fg = gui0A,
    ctermfg = cterm0A,
  },
  csModifier = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  csType = {
    fg = gui08,
    ctermfg = cterm08,
  },
  csUnspecifiedStatement = {
    fg = gui0D,
    ctermfg = cterm0D,
  },
  csContextualStatement = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  csNewDecleration = {
    fg = gui08,
    ctermfg = cterm08,
  },

  -- CSS highlighting
  cssBraces = {
    fg = gui05,
    ctermfg = cterm05,
  },
  cssClassName = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  cssColor = {
    fg = gui0C,
    ctermfg = cterm0C,
  },

  -- Diff highlighting
  DiffAdd = {
    fg = gui0B,
    bg = gui01,
    ctermfg = cterm0B,
    ctermbg = cterm01,
  },
  DiffChange = {
    fg = gui03,
    bg = gui01,
    ctermfg = cterm03,
    ctermbg = cterm01,
  },
  DiffDelete = {
    fg = gui08,
    bg = gui01,
    ctermfg = cterm08,
    ctermbg = cterm01,
  },
  DiffText = {
    fg = gui0D,
    bg = gui01,
    ctermfg = cterm0D,
    ctermbg = cterm01,
  },
  DiffAdded = {
    fg = gui0B,
    bg = gui00,
    ctermfg = cterm0B,
    ctermbg = cterm00,
  },
  DiffFile = {
    fg = gui08,
    bg = gui00,
    ctermfg = cterm08,
    ctermbg = cterm00,
  },
  DiffNewFile = {
    fg = gui0B,
    bg = gui00,
    ctermfg = cterm0B,
    ctermbg = cterm00,
  },
  DiffLine = {
    fg = gui0D,
    bg = gui00,
    ctermfg = cterm0D,
    ctermbg = cterm00,
  },
  DiffRemoved = {
    fg = gui08,
    bg = gui00,
    ctermfg = cterm08,
    ctermbg = cterm00,
  },
  ["@text.diff.delete"] = {
    fg = gui08,
    bg = gui00,
    ctermfg = cterm08,
    ctermbg = cterm00,
  },
  ["@text.diff.add"] = {
    fg = gui0B,
    bg = gui00,
    ctermfg = cterm0B,
    ctermbg = cterm00,
  },
  ["@diff.plus.diff"] = {
    fg = gui0B,
    bg = gui00,
    ctermfg = cterm0B,
    ctermbg = cterm00,
  },
  ["@diff.minus.diff"] = {
    fg = gui08,
    bg = gui00,
    ctermfg = cterm08,
    ctermbg = cterm00,
  },

  -- Git highlighting
  gitcommitOverflow = {
    fg = gui08,
    ctermfg = cterm08,
  },
  gitcommitSummary = {
    fg = gui0B,
    ctermfg = cterm0B,
  },
  gitcommitComment = {
    fg = gui03,
    ctermfg = cterm03,
  },
  gitcommitUntracked = {
    fg = gui03,
    ctermfg = cterm03,
  },
  gitcommitDiscarded = {
    fg = gui03,
    ctermfg = cterm03,
  },
  gitcommitSelected = {
    fg = gui03,
    ctermfg = cterm03,
  },
  gitcommitHeader = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  gitcommitSelectedType = {
    fg = gui0D,
    ctermfg = cterm0D,
  },
  gitcommitUnmergedType = {
    fg = gui0D,
    ctermfg = cterm0D,
  },
  gitcommitDiscardedType = {
    fg = gui0D,
    ctermfg = cterm0D,
  },
  gitcommitBranch = {
    fg = gui09,
    ctermfg = cterm09,
    bold = true
  },
  gitcommitUntrackedFile = {
    fg = gui0A,
    ctermfg = cterm0A,
  },
  gitcommitUnmergedFile = {
    fg = gui08,
    ctermfg = cterm08,
    bold = true
  },
  gitcommitDiscardedFile = {
    fg = gui08,
    ctermfg = cterm08,
    bold = true
  },
  gitcommitSelectedFile = {
    fg = gui0B,
    ctermfg = cterm0B,
    bold = true
  },

  -- HTML highlighting
  htmlBold = {
    fg = gui0A,
    ctermfg = cterm0A,
  },
  htmlItalic = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  htmlEndTag = {
    fg = gui05,
    ctermfg = cterm05,
  },
  htmlTag = {
    fg = gui05,
    ctermfg = cterm05,
  },

  -- JavaScript highlighting
  javaScript = {
    fg = gui05,
    ctermfg = cterm05,
  },
  javaScriptBraces = {
    fg = gui05,
    ctermfg = cterm05,
  },
  javaScriptNumber = {
    fg = gui09,
    ctermfg = cterm09,
  },

  -- pangloss/vim-javascript highlighting
  jsOperator = {
    fg = gui0D,
    ctermfg = cterm0D,
  },
  jsStatement = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  jsReturn = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  jsThis = {
    fg = gui08,
    ctermfg = cterm08,
  },
  jsClassDefinition = {
    fg = gui0A,
    ctermfg = cterm0A,
  },
  jsFunction = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  jsFuncName = {
    fg = gui0D,
    ctermfg = cterm0D,
  },
  jsFuncCall = {
    fg = gui0D,
    ctermfg = cterm0D,
  },
  jsClassFuncName = {
    fg = gui0D,
    ctermfg = cterm0D,
  },
  jsClassMethodType = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  jsRegexpString = {
    fg = gui0C,
    ctermfg = cterm0C,
  },
  jsGlobalObjects = {
    fg = gui0A,
    ctermfg = cterm0A,
  },
  jsGlobalNodeObjects = {
    fg = gui0A,
    ctermfg = cterm0A,
  },
  jsExceptions = {
    fg = gui0A,
    ctermfg = cterm0A,
  },
  jsBuiltins = {
    fg = gui0A,
    ctermfg = cterm0A,
  },

  -- Mail highlighting
  mailQuoted1 = {
    fg = gui0A,
    ctermfg = cterm0A,
  },
  mailQuoted2 = {
    fg = gui0B,
    ctermfg = cterm0B,
  },
  mailQuoted3 = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  mailQuoted4 = {
    fg = gui0C,
    ctermfg = cterm0C,
  },
  mailQuoted5 = {
    fg = gui0D,
    ctermfg = cterm0D,
  },
  mailQuoted6 = {
    fg = gui0A,
    ctermfg = cterm0A,
  },
  mailURL = {
    fg = gui0D,
    ctermfg = cterm0D,
  },
  mailEmail = {
    fg = gui0D,
    ctermfg = cterm0D,
  },

  -- Markdown highlighting
  markdownCode = {
    fg = gui0B,
    ctermfg = cterm0B,
  },
  markdownError = {
    fg = gui05,
    bg = gui00,
    ctermfg = cterm05,
    ctermbg = cterm00,
  },
  markdownCodeBlock = {
    fg = gui0B,
    ctermfg = cterm0B,
  },
  markdownHeadingDelimiter = {
    fg = gui0D,
    ctermfg = cterm0D,
  },

  -- NERDTree highlighting
  NERDTreeDirSlash = {
    fg = gui0D,
    ctermfg = cterm0D,
  },
  NERDTreeExecFile = {
    fg = gui05,
    ctermfg = cterm05,
  },

  -- PHP highlighting
  phpMemberSelector = {
    fg = gui05,
    ctermfg = cterm05,
  },
  phpComparison = {
    fg = gui05,
    ctermfg = cterm05,
  },
  phpParent = {
    fg = gui05,
    ctermfg = cterm05,
  },
  phpMethodsVar = {
    fg = gui0C,
    ctermfg = cterm0C,
  },

  -- Python highlighting
  pythonOperator = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  pythonRepeat = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  pythonInclude = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  pythonStatement = {
    fg = gui0E,
    ctermfg = cterm0E,
  },

  -- Ruby highlighting
  rubyAttribute = {
    fg = gui0D,
    ctermfg = cterm0D,
  },
  rubyConstant = {
    fg = gui0A,
    ctermfg = cterm0A,
  },
  rubyInterpolation = {
    fg = gui0B,
    ctermfg = cterm0B,
  },
  rubyInterpolationDelimiter = {
    fg = gui0F,
    ctermfg = cterm0F,
  },
  rubyRegexp = {
    fg = gui0C,
    ctermfg = cterm0C,
  },
  rubySymbol = {
    fg = gui0B,
    ctermfg = cterm0B,
  },
  rubyStringDelimiter = {
    fg = gui0B,
    ctermfg = cterm0B,
  },

  -- SASS highlighting
  sassidChar = {
    fg = gui08,
    ctermfg = cterm08,
  },
  sassClassChar = {
    fg = gui09,
    ctermfg = cterm09,
  },
  sassInclude = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  sassMixing = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  sassMixinName = {
    fg = gui0D,
    ctermfg = cterm0D,
  },

  -- Spelling highlighting
  SpellBad = {
    bg = gui00,
    ctermbg = cterm00,
    undercurl = true
  },
  SpellLocal = {
    bg = gui00,
    ctermbg = cterm00,
    undercurl = true
  },
  SpellCap = {
    bg = gui00,
    ctermbg = cterm00,
    undercurl = true
  },
  SpellRare = {
    bg = gui00,
    ctermbg = cterm00,
    undercurl = true
  },

  -- Java highlighting
  javaOperator = {
    fg = gui0D,
    ctermfg = cterm0D,
  },
}) do
  vim.api.nvim_set_hl(0, group, settings)
end
