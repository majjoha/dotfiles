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

-- LuaFormatter off
for group, settings in pairs({
  -- Vim editor colors
  Bold = {
    gui = "bold",
    cterm = "bold",
  },
  ColorColumn = {
    guibg = gui01,
    ctermbg = cterm01,
    gui = "none",
    cterm = "none",
  },
  Conceal = {
    guifg = gui0D,
    guibg = gui00,
    ctermfg = cterm0D,
    ctermbg = cterm00,
  },
  Cursor = {
    guifg = gui00,
    guibg = gui05,
    ctermfg = cterm00,
    ctermbg = cterm05,
  },
  CursorColumn = {
    guibg = gui01,
    ctermbg = cterm01,
    gui = "none",
    cterm = "none",
  },
  CursorLine = {
    guibg = gui01,
    ctermbg = cterm01,
    gui = "none",
    cterm = "none",
  },
  CursorLineNr = {
    guifg = gui03,
    guibg = gui01,
    ctermfg = cterm03,
    ctermbg = cterm01,
  },
  Debug = {
    guifg = gui08,
    ctermfg = cterm08,
  },
  Directory = {
    guifg = gui0D,
    ctermfg = cterm0D,
  },
  Error = {
    guifg = gui00,
    guibg = gui08,
    ctermfg = cterm00,
    ctermbg = cterm08,
  },
  ErrorMsg = {
    guifg = gui08,
    guibg = gui00,
    ctermfg = cterm08,
    ctermbg = cterm00,
  },
  Exception = {
    guifg = gui08,
    ctermfg = cterm08,
  },
  FoldColumn = {
    guibg = gui01,
    ctermbg = cterm01,
  },
  Folded = {
    guifg = gui03,
    guibg = gui01,
    ctermfg = cterm03,
    ctermbg = cterm01,
  },
  IncSearch = {
    guifg = gui01,
    guibg = gui09,
    ctermfg = cterm01,
    ctermbg = cterm09,
    gui = "none",
    cterm = "none",
  },
  Italic = {
    gui = "none",
    cterm = "none",
  },
  LineNr = {
    guifg = gui03,
    guibg = gui01,
    ctermfg = cterm03,
    ctermbg = cterm01,
  },
  Macro = {
    guifg = gui08,
    ctermfg = cterm08,
  },
  MatchParen = {
    guifg = gui00,
    guibg = gui03,
    ctermfg = cterm00,
    ctermbg = cterm03,
  },
  ModeMsg = {
    guifg = gui0B,
    ctermfg = cterm0B,
  },
  MoreMsg = {
    guifg = gui0B,
    ctermfg = cterm0B,
  },
  NonText = {
    guifg = gui03,
    ctermfg = cterm03,
  },
  Normal = {
    guifg = gui05,
    guibg = gui00,
    ctermfg = cterm05,
    ctermbg = cterm00,
  },
  PMenu = {
    guifg = gui04,
    guibg = gui01,
    ctermfg = cterm04,
    ctermbg = cterm01,
  },
  PMenuSel = {
    guifg = gui01,
    guibg = gui04,
    ctermfg = cterm01,
    ctermbg = cterm04,
  },
  Question = {
    guifg = gui0D,
    ctermfg = cterm0D,
  },
  QuickFixLine = {
    guibg = gui01,
    ctermbg = cterm01,
    gui = "none",
    cterm = "none",
  },
  Search = {
    guifg = gui03,
    guibg = gui0A,
    ctermfg = cterm03,
    ctermbg = cterm0A,
  },
  SignColumn = {
    guifg = gui03,
    guibg = gui01,
    ctermfg = cterm03,
    ctermbg = cterm01,
  },
  SpecialKey = {
    guifg = gui03,
    ctermfg = cterm03,
  },
  StatusLine = {
    guifg = gui04,
    guibg = gui02,
    ctermfg = cterm04,
    ctermbg = cterm02,
    gui = "none",
    cterm = "none",
  },
  StatusLineNC = {
    guifg = gui03,
    guibg = gui01,
    ctermfg = cterm03,
    ctermbg = cterm01,
    gui = "none",
    cterm = "none",
  },
  Substitute = {
    guifg = gui01,
    guibg = gui0A,
    ctermfg = cterm01,
    ctermbg = cterm0A,
    gui = "none",
    cterm = "none",
  },
  TabLine = {
    guifg = gui03,
    guibg = gui01,
    ctermfg = cterm03,
    ctermbg = cterm01,
    gui = "none",
    cterm = "none",
  },
  TabLineFill = {
    guifg = gui03,
    guibg = gui01,
    ctermfg = cterm03,
    ctermbg = cterm01,
    gui = "none",
    cterm = "none",
  },
  TabLineSel = {
    guifg = gui0B,
    guibg = gui01,
    ctermfg = cterm0B,
    ctermbg = cterm01,
    gui = "none",
    cterm = "none",
  },
  Title = {
    guifg = gui0D,
    ctermfg = cterm0D,
    gui = "none",
    cterm = "none",
  },
  TooLong = {
    guifg = gui08,
    ctermfg = cterm08,
  },
  Underlined = {
    guifg = gui08,
    ctermfg = cterm08,
  },
  VertSplit = {
    guifg = gui02,
    guibg = gui02,
    ctermfg = cterm02,
    ctermbg = cterm02,
    gui = "none",
    cterm = "none",
  },
  Visual = {
    guibg = gui02,
    ctermbg = cterm02,
  },
  VisualNOS = {
    guifg = gui08,
    ctermfg = cterm08,
  },
  WarningMsg = {
    guifg = gui08,
    ctermfg = cterm08,
  },
  WildMenu = {
    guifg = gui08,
    guibg = gui0A,
    ctermfg = cterm08,
  },

  -- Standard syntax highlighting
  Boolean = {
    guifg = gui09,
    ctermfg = cterm09,
  },
  Character = {
    guifg = gui08,
    ctermfg = cterm08,
  },
  Comment = {
    guifg = gui03,
    ctermfg = cterm03,
  },
  Conditional = {
    guifg = gui0E,
    ctermfg = cterm0E,
  },
  Constant = {
    guifg = gui09,
    ctermfg = cterm09,
  },
  Define = {
    guifg = gui0E,
    ctermfg = cterm0E,
    gui = "none",
    cterm = "none",
  },
  Delimiter = {
    guifg = gui0F,
    ctermfg = cterm0F,
  },
  Float = {
    guifg = gui09,
    ctermfg = cterm09,
  },
  Function = {
    guifg = gui0D,
    ctermfg = cterm0D,
  },
  Identifier = {
    guifg = gui08,
    ctermfg = cterm08,
    gui = "none",
    cterm = "none",
  },
  Include = {
    guifg = gui0D,
    ctermfg = cterm0D,
  },
  Keyword = {
    guifg = gui0E,
    ctermfg = cterm0E,
  },
  Label = {
    guifg = gui0A,
    ctermfg = cterm0A,
  },
  Number = {
    guifg = gui09,
    ctermfg = cterm09,
  },
  Operator = {
    guifg = gui05,
    ctermfg = cterm05,
    gui = "none",
    cterm = "none",
  },
  PreProc = {
    guifg = gui0A,
    ctermfg = cterm0A,
  },
  Repeat = {
    guifg = gui0A,
    ctermfg = cterm0A,
  },
  Special = {
    guifg = gui0C,
    ctermfg = cterm0C,
  },
  SpecialChar = {
    guifg = gui0F,
    ctermfg = cterm0F,
  },
  Statement = {
    guifg = gui08,
    ctermfg = cterm08,
  },
  StorageClass = {
    guifg = gui0A,
    ctermfg = cterm0A,
  },
  String = {
    guifg = gui0B,
    ctermfg = cterm0B,
  },
  Structure = {
    guifg = gui0E,
    ctermfg = cterm0E,
  },
  Tag = {
    guifg = gui0A,
    ctermfg = cterm0A,
  },
  Todo = {
    guifg = gui0A,
    guibg = gui01,
    ctermfg = cterm0A,
    ctermbg = cterm01,
  },
  Type = {
    guifg = gui0A,
    ctermfg = cterm0A,
    gui = "none",
    cterm = "none",
  },
  Typedef = {
    guifg = gui0A,
    ctermfg = cterm0A,
  },

  -- C highlighting
  cOperator = {
    guifg = gui0C,
    ctermfg = cterm0C,
  },
  cPreCondit = {
    guifg = gui0E,
    ctermfg = cterm0E,
  },

  -- C# highlighting
  csClass = {
    guifg = gui0A,
    ctermfg = cterm0A,
  },
  csAttribute = {
    guifg = gui0A,
    ctermfg = cterm0A,
  },
  csModifier = {
    guifg = gui0E,
    ctermfg = cterm0E,
  },
  csType = {
    guifg = gui08,
    ctermfg = cterm08,
  },
  csUnspecifiedStatement = {
    guifg = gui0D,
    ctermfg = cterm0D,
  },
  csContextualStatement = {
    guifg = gui0E,
    ctermfg = cterm0E,
  },
  csNewDecleration = {
    guifg = gui08,
    ctermfg = cterm08,
  },

  -- CSS highlighting
  cssBraces = {
    guifg = gui05,
    ctermfg = cterm05,
  },
  cssClassName = {
    guifg = gui0E,
    ctermfg = cterm0E,
  },
  cssColor = {
    guifg = gui0C,
    ctermfg = cterm0C,
  },

  -- Diff highlighting
  DiffAdd = {
    guifg = gui0B,
    guibg = gui01,
    ctermfg = cterm0B,
    ctermbg = cterm01,
  },
  DiffChange = {
    guifg = gui03,
    guibg = gui01,
    ctermfg = cterm03,
    ctermbg = cterm01,
  },
  DiffDelete = {
    guifg = gui08,
    guibg = gui01,
    ctermfg = cterm08,
    ctermbg = cterm01,
  },
  DiffText = {
    guifg = gui0D,
    guibg = gui01,
    ctermfg = cterm0D,
    ctermbg = cterm01,
  },
  DiffAdded = {
    guifg = gui0B,
    guibg = gui00,
    ctermfg = cterm0B,
    ctermbg = cterm00,
  },
  DiffFile = {
    guifg = gui08,
    guibg = gui00,
    ctermfg = cterm08,
    ctermbg = cterm00,
  },
  DiffNewFile = {
    guifg = gui0B,
    guibg = gui00,
    ctermfg = cterm0B,
    ctermbg = cterm00,
  },
  DiffLine = {
    guifg = gui0D,
    guibg = gui00,
    ctermfg = cterm0D,
    ctermbg = cterm00,
  },
  DiffRemoved = {
    guifg = gui08,
    guibg = gui00,
    ctermfg = cterm08,
    ctermbg = cterm00,
  },

  -- Git highlighting
  gitcommitOverflow = {
    guifg = gui08,
    ctermfg = cterm08,
  },
  gitcommitSummary = {
    guifg = gui0B,
    ctermfg = cterm0B,
  },
  gitcommitComment = {
    guifg = gui03,
    ctermfg = cterm03,
  },
  gitcommitUntracked = {
    guifg = gui03,
    ctermfg = cterm03,
  },
  gitcommitDiscarded = {
    guifg = gui03,
    ctermfg = cterm03,
  },
  gitcommitSelected = {
    guifg = gui03,
    ctermfg = cterm03,
  },
  gitcommitHeader = {
    guifg = gui0E,
    ctermfg = cterm0E,
  },
  gitcommitSelectedType = {
    guifg = gui0D,
    ctermfg = cterm0D,
  },
  gitcommitUnmergedType = {
    guifg = gui0D,
    ctermfg = cterm0D,
  },
  gitcommitDiscardedType = {
    guifg = gui0D,
    ctermfg = cterm0D,
  },
  gitcommitBranch = {
    guifg = gui09,
    ctermfg = cterm09,
    gui = "bold",
    cterm = "bold",
  },
  gitcommitUntrackedFile = {
    guifg = gui0A,
    ctermfg = cterm0A,
  },
  gitcommitUnmergedFile = {
    guifg = gui08,
    ctermfg = cterm08,
    gui = "bold",
    cterm = "bold",
  },
  gitcommitDiscardedFile = {
    guifg = gui08,
    ctermfg = cterm08,
    gui = "bold",
    cterm = "bold",
  },
  gitcommitSelectedFile = {
    guifg = gui0B,
    ctermfg = cterm0B,
    gui = "bold",
    cterm = "bold",
  },

  -- HTML highlighting
  htmlBold = {
    guifg = gui0A,
    ctermfg = cterm0A,
  },
  htmlItalic = {
    guifg = gui0E,
    ctermfg = cterm0E,
  },
  htmlEndTag = {
    guifg = gui05,
    ctermfg = cterm05,
  },
  htmlTag = {
    guifg = gui05,
    ctermfg = cterm05,
  },

  -- JavaScript highlighting
  javaScript = {
    guifg = gui05,
    ctermfg = cterm05,
  },
  javaScriptBraces = {
    guifg = gui05,
    ctermfg = cterm05,
  },
  javaScriptNumber = {
    guifg = gui09,
    ctermfg = cterm09,
  },

  -- pangloss/vim-javascript highlighting
  jsOperator = {
    guifg = gui0D,
    ctermfg = cterm0D,
  },
  jsStatement = {
    guifg = gui0E,
    ctermfg = cterm0E,
  },
  jsReturn = {
    guifg = gui0E,
    ctermfg = cterm0E,
  },
  jsThis = {
    guifg = gui08,
    ctermfg = cterm08,
  },
  jsClassDefinition = {
    guifg = gui0A,
    ctermfg = cterm0A,
  },
  jsFunction = {
    guifg = gui0E,
    ctermfg = cterm0E,
  },
  jsFuncName = {
    guifg = gui0D,
    ctermfg = cterm0D,
  },
  jsFuncCall = {
    guifg = gui0D,
    ctermfg = cterm0D,
  },
  jsClassFuncName = {
    guifg = gui0D,
    ctermfg = cterm0D,
  },
  jsClassMethodType = {
    guifg = gui0E,
    ctermfg = cterm0E,
  },
  jsRegexpString = {
    guifg = gui0C,
    ctermfg = cterm0C,
  },
  jsGlobalObjects = {
    guifg = gui0A,
    ctermfg = cterm0A,
  },
  jsGlobalNodeObjects = {
    guifg = gui0A,
    ctermfg = cterm0A,
  },
  jsExceptions = {
    guifg = gui0A,
    ctermfg = cterm0A,
  },
  jsBuiltins = {
    guifg = gui0A,
    ctermfg = cterm0A,
  },

  -- Mail highlighting
  mailQuoted1 = {
    guifg = gui0A,
    ctermfg = cterm0A,
  },
  mailQuoted2 = {
    guifg = gui0B,
    ctermfg = cterm0B,
  },
  mailQuoted3 = {
    guifg = gui0E,
    ctermfg = cterm0E,
  },
  mailQuoted4 = {
    guifg = gui0C,
    ctermfg = cterm0C,
  },
  mailQuoted5 = {
    guifg = gui0D,
    ctermfg = cterm0D,
  },
  mailQuoted6 = {
    guifg = gui0A,
    ctermfg = cterm0A,
  },
  mailURL = {
    guifg = gui0D,
    ctermfg = cterm0D,
  },
  mailEmail = {
    guifg = gui0D,
    ctermfg = cterm0D,
  },

  -- Markdown highlighting
  markdownCode = {
    guifg = gui0B,
    ctermfg = cterm0B,
  },
  markdownError = {
    guifg = gui05,
    guibg = gui00,
    ctermfg = cterm05,
    ctermbg = cterm00,
  },
  markdownCodeBlock = {
    guifg = gui0B,
    ctermfg = cterm0B,
  },
  markdownHeadingDelimiter = {
    guifg = gui0D,
    ctermfg = cterm0D,
  },

  -- NERDTree highlighting
  NERDTreeDirSlash = {
    guifg = gui0D,
    ctermfg = cterm0D,
  },
  NERDTreeExecFile = {
    guifg = gui05,
    ctermfg = cterm05,
  },

  -- PHP highlighting
  phpMemberSelector = {
    guifg = gui05,
    ctermfg = cterm05,
  },
  phpComparison = {
    guifg = gui05,
    ctermfg = cterm05,
  },
  phpParent = {
    guifg = gui05,
    ctermfg = cterm05,
  },
  phpMethodsVar = {
    guifg = gui0C,
    ctermfg = cterm0C,
  },

  -- Python highlighting
  pythonOperator = {
    guifg = gui0E,
    ctermfg = cterm0E,
  },
  pythonRepeat = {
    guifg = gui0E,
    ctermfg = cterm0E,
  },
  pythonInclude = {
    guifg = gui0E,
    ctermfg = cterm0E,
  },
  pythonStatement = {
    guifg = gui0E,
    ctermfg = cterm0E,
  },

  -- Ruby highlighting
  rubyAttribute = {
    guifg = gui0D,
    ctermfg = cterm0D,
  },
  rubyConstant = {
    guifg = gui0A,
    ctermfg = cterm0A,
  },
  rubyInterpolation = {
    guifg = gui0B,
    ctermfg = cterm0B,
  },
  rubyInterpolationDelimiter = {
    guifg = gui0F,
    ctermfg = cterm0F,
  },
  rubyRegexp = {
    guifg = gui0C,
    ctermfg = cterm0C,
  },
  rubySymbol = {
    guifg = gui0B,
    ctermfg = cterm0B,
  },
  rubyStringDelimiter = {
    guifg = gui0B,
    ctermfg = cterm0B,
  },

  -- SASS highlighting
  sassidChar = {
    guifg = gui08,
    ctermfg = cterm08,
  },
  sassClassChar = {
    guifg = gui09,
    ctermfg = cterm09,
  },
  sassInclude = {
    guifg = gui0E,
    ctermfg = cterm0E,
  },
  sassMixing = {
    guifg = gui0E,
    ctermfg = cterm0E,
  },
  sassMixinName = {
    guifg = gui0D,
    ctermfg = cterm0D,
  },

  -- Spelling highlighting
  SpellBad = {
    guibg = gui00,
    ctermbg = cterm00,
    gui = "undercurl",
    cterm = "undercurl",
  },
  SpellLocal = {
    guibg = gui00,
    ctermbg = cterm00,
    gui = "undercurl",
    cterm = "undercurl",
  },
  SpellCap = {
    guibg = gui00,
    ctermbg = cterm00,
    gui = "undercurl",
    cterm = "undercurl",
  },
  SpellRare = {
    guibg = gui00,
    ctermbg = cterm00,
    gui = "undercurl",
    cterm = "undercurl",
  },

  -- Java highlighting
  javaOperator = {
    guifg = gui0D,
    ctermfg = cterm0D,
  },
}) do
  vim.highlight.create(group, settings)
end
-- LuaFormatter on
