local gui00 = "#f4efe7"
local gui01 = "#9f5032"
local gui02 = "#7c7e44"
local gui03 = "#a38a6b"
local gui04 = "#58657e"
local gui05 = "#9f8665"
local gui06 = "#7c5f47"
local gui07 = "#2f2f2d"
local gui08 = "#2f2f2d"
local gui09 = "#966d5d"
local gui0A = "#e3dbd0"
local gui0B = "#cbbda9"
local gui0C = "#555a64"
local gui0D = "#2b2722"
local gui0E = "#6f6359"
local gui0F = "#141310"

local cterm00 = 00
local cterm01 = 10
local cterm02 = 11
local cterm03 = 08
local cterm04 = 12
local cterm05 = 07
local cterm06 = 13
local cterm07 = 15
local cterm08 = 01
local cterm09 = 09
local cterm0A = 03
local cterm0B = 02
local cterm0C = 06
local cterm0D = 04
local cterm0E = 05
local cterm0F = 14

vim.cmd([[
  highlight clear
  syntax reset
]])
vim.g.colors_name = "majjoha"

for group, settings in pairs({
  -- Core UI highlights
  -- Basic cursor and line highlighting
  Normal = {
    fg = gui05,
    bg = gui00,
    ctermfg = cterm05,
    ctermbg = cterm00,
  },
  NormalNC = {},
  Cursor = {
    fg = gui00,
    bg = gui05,
    ctermfg = cterm00,
    ctermbg = cterm05,
  },
  CursorLine = {},
  CursorColumn = {
    bg = gui01,
    ctermbg = cterm01,
  },
  CursorLineNr = {
    ctermfg = cterm05,
  },
  LineNr = {
    ctermfg = cterm04,
  },
  lCursor = {},
  CursorIM = {},
  TermCursor = {},
  TermCursorNC = {},
  SignColumn = {
    ctermbg = cterm00,
  },
  ColorColumn = {
    bg = gui01,
    ctermbg = cterm01,
  },
  MatchParen = {
    bg = gui03,
    ctermbg = cterm03,
  },
  Conceal = {
    fg = gui0D,
    bg = gui00,
    ctermfg = cterm0D,
    ctermbg = cterm00,
  },
  -- Editor interface
  -- Statuslines and tabs
  StatusLine = {
    ctermbg = cterm01,
    ctermfg = cterm05,
  },
  StatusLineNC = {
    ctermbg = cterm01,
    ctermfg = cterm03,
  },
  StatusLineTerm = {
    link = "StatusLine",
  },
  StatusLineTermNC = {
    link = "StatusLineNC",
  },
  TabLine = {
    fg = gui0F,
    bg = gui01,
    ctermfg = cterm0F,
    ctermbg = cterm01,
  },
  TabLineFill = {
    fg = gui0F,
    bg = gui01,
    ctermfg = cterm0F,
    ctermbg = cterm01,
  },
  TabLineSel = {
    fg = gui05,
    bg = gui01,
    ctermfg = cterm05,
    ctermbg = cterm02,
  },
  WinSeparator = {
    ctermfg = cterm01,
  },
  WinBar = {},
  WinBarNC = {},
  -- Menu completion
  Pmenu = {
    fg = gui05,
    bg = gui01,
    ctermfg = cterm05,
    ctermbg = cterm01,
  },
  PmenuSel = {
    fg = gui05,
    bg = gui02,
    ctermfg = cterm05,
    ctermbg = cterm02,
  },
  PmenuMatch = {
    cterm = {
      bold = true,
    },
  },
  PmenuMatchSel = {
    fg = gui05,
    bg = gui02,
    ctermfg = cterm05,
    ctermbg = cterm02,
  },
  PmenuExtra = {},
  PmenuExtraSel = {
    fg = gui05,
    bg = gui02,
    ctermfg = cterm05,
    ctermbg = cterm02,
  },
  PmenuKind = {
    cterm = {
      italic = true,
    },
  },
  PmenuKindSel = {
    fg = gui05,
    bg = gui02,
    ctermfg = cterm05,
    ctermbg = cterm02,
    cterm = {
      italic = true,
    },
  },
  PmenuSbar = {},
  PmenuThumb = {},
  PmenuBorder = {
    ctermbg = cterm05,
    ctermfg = cterm05,
  },
  PmenuShadow = {},
  PmenuShadowThrough = {},
  ComplMatchIns = {},
  PreInsert = {},
  ComplHint = {},
  ComplHintMore = {},
  -- Floating windows
  FloatBorder = {
    ctermfg = cterm05,
    ctermbg = cterm00,
  },
  NormalFloat = {
    ctermbg = cterm00,
  },
  FloatTitle = {},
  FloatFooter = {},
  -- Other interface elements
  Directory = {
    fg = gui0D,
    ctermfg = cterm0D,
  },
  Title = {
    fg = gui0D,
    ctermfg = cterm0D,
  },
  Question = {
    fg = gui0D,
    ctermfg = cterm0D,
  },
  QuickFixLine = {
    bg = gui01,
    ctermbg = cterm01,
  },
  EndOfBuffer = {},
  -- Message and status indicators
  ModeMsg = {
    ctermfg = cterm03,
  },
  MoreMsg = {
    fg = gui0B,
    ctermfg = cterm0B,
  },
  ErrorMsg = {
    fg = gui08,
    bg = gui00,
    ctermfg = cterm08,
    ctermbg = cterm00,
  },
  WarningMsg = {
    fg = gui08,
    ctermfg = cterm08,
  },
  Error = {
    fg = gui00,
    bg = gui08,
    ctermfg = cterm00,
    ctermbg = cterm08,
  },
  Debug = {
    fg = gui08,
    ctermfg = cterm08,
  },
  Exception = {
    fg = gui08,
    ctermfg = cterm08,
  },
  Macro = {
    fg = gui08,
    ctermfg = cterm08,
  },
  OkMsg = {},
  StderrMsg = {},
  StdoutMsg = {},
  MsgArea = {},
  MsgSeparator = {},
  -- Text formatting
  Bold = {
    bold = true,
  },
  Italic = {},
  Underlined = {
    fg = gui08,
    ctermfg = cterm08,
  },
  SpecialKey = {
    fg = gui03,
    ctermfg = cterm03,
  },
  NonText = {
    ctermfg = cterm01,
  },
  Whitespace = {},
  Substitute = {
    fg = gui01,
    bg = gui0A,
    ctermfg = cterm01,
    ctermbg = cterm0A,
  },
  IncSearch = {
    fg = gui05,
    bg = gui02,
    ctermfg = cterm05,
    ctermbg = cterm02,
  },
  CurSearch = {
    fg = gui05,
    bg = gui02,
    ctermfg = cterm05,
    ctermbg = cterm02,
  },
  Search = {
    bg = gui01,
    ctermbg = cterm01,
  },
  TooLong = {
    fg = gui08,
    ctermfg = cterm08,
  },
  WildMenu = {
    fg = gui08,
    bg = gui0A,
    ctermfg = cterm08,
  },
  -- Folding and regions
  Folded = {
    fg = gui03,
    bg = gui01,
    ctermfg = cterm03,
    ctermbg = cterm00,
    cterm = { italic = true },
  },
  FoldColumn = {
    link = "Normal",
  },
  Visual = {
    bg = gui02,
    ctermbg = cterm01,
  },
  VisualNOS = {
    fg = gui08,
    ctermfg = cterm08,
  },
  -- Standard syntax highlighting
  Comment = {
    fg = gui05,
    ctermfg = cterm05,
    cterm = { italic = true },
  },
  CommentBlock = {
    bg = gui01,
    ctermbg = cterm01,
  },
  CommentBlockMarker = {
    fg = gui03,
    bg = gui01,
    ctermfg = cterm03,
    ctermbg = cterm01,
  },
  String = {
    fg = gui05,
    ctermfg = cterm05,
  },
  Number = {
    fg = gui05,
    ctermfg = cterm05,
  },
  Boolean = {
    fg = gui05,
    ctermfg = cterm05,
  },
  Constant = {
    fg = gui05,
    ctermfg = cterm05,
  },
  Character = {
    fg = gui05,
    ctermfg = cterm05,
  },
  Float = {
    fg = gui05,
    ctermfg = cterm05,
  },
  Identifier = {
    fg = gui05,
    ctermfg = cterm05,
  },
  Function = {
    fg = gui05,
    ctermfg = cterm05,
  },
  Keyword = {
    fg = gui03,
    ctermfg = cterm03,
  },
  Statement = {
    fg = gui05,
    ctermfg = cterm05,
  },
  Conditional = {
    fg = gui05,
    ctermfg = cterm05,
  },
  Repeat = {
    fg = gui05,
    ctermfg = cterm05,
  },
  Label = {
    fg = gui05,
    ctermfg = cterm05,
  },
  Include = {
    fg = gui05,
    ctermfg = cterm05,
  },
  Define = {
    fg = gui05,
    ctermfg = cterm05,
  },
  PreProc = {
    fg = gui05,
    ctermfg = cterm05,
  },
  Type = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  Typedef = {
    fg = gui0D,
    ctermfg = cterm0D,
  },
  Structure = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  Delimiter = {
    fg = gui0A,
    ctermfg = cterm0A,
  },
  Operator = {
    fg = gui03,
    ctermfg = cterm03,
  },
  Special = {
    fg = gui05,
    ctermfg = cterm05,
  },
  SpecialChar = {
    fg = gui05,
    ctermfg = cterm05,
  },
  Tag = {
    fg = gui05,
    ctermfg = cterm05,
  },
  Todo = {
    fg = gui0A,
    bg = gui01,
    ctermfg = cterm0A,
    ctermbg = cterm01,
  },
  StorageClass = {
    fg = gui05,
    ctermfg = cterm05,
  },
  Ignore = {},
  -- Spelling
  SpellBad = {
    ctermfg = cterm08,
    undercurl = true,
  },
  SpellLocal = {
    bg = gui00,
    ctermbg = cterm00,
    undercurl = true,
  },
  SpellCap = {
    ctermfg = cterm08,
    undercurl = true,
  },
  SpellRare = {
    bg = gui00,
    ctermbg = cterm00,
    undercurl = true,
  },
  -- Diagnostics
  DiagnosticSignError = {
    ctermfg = cterm08,
    ctermbg = cterm00,
  },
  DiagnosticSignWarn = {
    ctermfg = cterm0A,
    ctermbg = cterm00,
  },
  DiagnosticSignHint = {
    ctermfg = cterm05,
    ctermbg = cterm00,
  },
  DiagnosticSignInfo = {
    ctermfg = cterm05,
    ctermbg = cterm00,
  },
  DiagnosticVirtualLinesError = {
    ctermfg = cterm03,
    ctermbg = cterm00,
  },
  DiagnosticVirtualLinesWarn = {
    ctermfg = cterm03,
    ctermbg = cterm00,
  },
  DiagnosticVirtualLinesHint = {
    ctermfg = cterm03,
    ctermbg = cterm00,
  },
  DiagnosticVirtualLinesInfo = {
    ctermfg = cterm03,
    ctermbg = cterm00,
  },
  DiagnosticVirtualLinesOk = {
    ctermfg = cterm03,
    ctermbg = cterm00,
  },
  DiagnosticFloatingError = {
    ctermfg = cterm03,
    ctermbg = cterm00,
  },
  DiagnosticFloatingWarn = {
    ctermfg = cterm03,
    ctermbg = cterm00,
  },
  DiagnosticFloatingHint = {
    ctermfg = cterm03,
    ctermbg = cterm00,
  },
  DiagnosticFloatingInfo = {
    ctermfg = cterm03,
    ctermbg = cterm00,
  },
  DiagnosticFloatingOk = {
    ctermfg = cterm03,
    ctermbg = cterm00,
  },
  DiagnosticUnderlineError = {
    cterm = { undercurl = true },
  },
  DiagnosticUnderlineWarn = {
    cterm = { undercurl = true },
  },
  DiagnosticUnderlineHint = {
    cterm = { undercurl = true },
  },
  DiagnosticUnderlineInfo = {
    cterm = { undercurl = true },
  },
  DiagnosticUnderlineOk = {
    cterm = { undercurl = true },
  },
  DiagnosticError = {},
  DiagnosticWarn = {},
  DiagnosticInfo = {},
  DiagnosticHint = {},
  DiagnosticOk = {},
  -- Diff and version control
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
  Added = {},
  Changed = {},
  Removed = {},
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
  ["jjAdded"] = {
    fg = gui0B,
    bg = gui00,
    ctermfg = cterm0B,
    ctermbg = cterm00,
  },
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
    bold = true,
  },
  gitcommitUntrackedFile = {
    fg = gui0A,
    ctermfg = cterm0A,
  },
  gitcommitUnmergedFile = {
    fg = gui08,
    ctermfg = cterm08,
    bold = true,
  },
  gitcommitDiscardedFile = {
    fg = gui08,
    ctermfg = cterm08,
    bold = true,
  },
  gitcommitSelectedFile = {
    fg = gui0B,
    ctermfg = cterm0B,
    bold = true,
  },
  -- Plugin-specific highlighting
  MiniFilesBorder = {
    ctermfg = cterm01,
  },
  OtherSelector = {
    ctermfg = cterm01,
  },
  OtherUnderlined = {
    ctermfg = cterm05,
  },
  -- Treesitter/LSP
  LspReferenceText = {
    underline = true,
    sp = "#a28752",
  },
  ["@lsp.type.namespace"] = { link = "@namespace", default = true },
  -- ["@lsp.type.type"] = {
  --   fg = gui0E,
  --   ctermfg = cterm0E,
  -- },
  ["@lsp.type.class"] = { link = "@type", default = true },
  ["@lsp.type.enum"] = { link = "@type", default = true },
  ["@lsp.type.interface"] = { link = "@type", default = true },
  ["@lsp.type.struct"] = { link = "@structure", default = true },
  ["@lsp.type.parameter"] = { link = "@parameter", default = true },
  ["@lsp.type.typeParameter"] = { link = "@type", default = true },
  ["@lsp.type.variable"] = { link = "@variable", default = true },
  ["@lsp.type.property"] = { link = "@property", default = true },
  ["@lsp.type.enumMember"] = { link = "@constant", default = true },
  ["@lsp.type.function"] = { link = "@function", default = true },
  ["@lsp.type.method"] = { link = "@method", default = true },
  ["@lsp.type.macro"] = { link = "@macro", default = true },
  ["@lsp.type.decorator"] = { link = "@function", default = true },
  -- Treesitter highlights (linked to standard syntax groups)
  ["@comment"] = { link = "Comment" },
  ["@string"] = { link = "String" },
  ["@number"] = { link = "Number" },
  ["@boolean"] = { link = "Boolean" },
  ["@variable"] = { link = "Identifier" },
  ["@function"] = { link = "Function" },
  ["@function.call"] = { link = "Function" },
  ["@method"] = { link = "Function" },
  ["@method.call"] = { link = "Function" },
  ["@keyword"] = { link = "Keyword" },
  ["@operator"] = { link = "Operator" },
  ["@type"] = { link = "Type" },
  ["@type.definition"] = { link = "Typedef" },
  ["@attribute"] = {},
  ["@property"] = { link = "Identifier" },
  ["@field"] = { link = "Identifier" },
  ["@parameter"] = { link = "Identifier" },
  ["@module"] = { link = "Include" },
  ["@namespace"] = { link = "Include" },
  ["@string.escape"] = { link = "SpecialChar" },
  ["@string.special"] = { link = "SpecialChar" },
  ["@character"] = { link = "Character" },
  ["@character.special"] = { link = "SpecialChar" },
  ["@conditional"] = { link = "Conditional" },
  ["@repeat"] = { link = "Repeat" },
  ["@label"] = { link = "Label" },
  ["@include"] = { link = "Include" },
  ["@define"] = { link = "Define" },
  ["@exception"] = { link = "Exception" },
  ["@constant"] = { link = "Constant" },
  ["@constant.builtin"] = { link = "Constant" },
  ["@constant.macro"] = { link = "Macro" },
  ["@struct"] = { link = "Structure" },
  ["@enum"] = { link = "Type" },
  ["@enum.member"] = { link = "Constant" },
  ["@constructor"] = { link = "Function" },
  ["@tag"] = { link = "Tag" },
  ["@tag.attribute"] = { link = "Identifier" },
  ["@tag.delimiter"] = { link = "Delimiter" },
  ["@text"] = {},
  ["@text.strong"] = { link = "Bold" },
  ["@text.emphasis"] = {},
  ["@text.underline"] = { link = "Underlined" },
  ["@text.strike"] = {},
  ["@text.title"] = { link = "Title" },
  ["@text.literal"] = { link = "String" },
  ["@text.uri"] = {},
  ["@text.math"] = {},
  ["@text.environment"] = {},
  ["@text.environment.name"] = {},
  ["@text.reference"] = {},
  ["@text.todo"] = { link = "Todo" },
  ["@text.note"] = { link = "MoreMsg" },
  ["@text.warning"] = { link = "WarningMsg" },
  ["@text.danger"] = { link = "ErrorMsg" },
  ["@punctuation"] = { link = "Delimiter" },
  ["@punctuation.bracket"] = { link = "Delimiter" },
  ["@punctuation.delimiter"] = { link = "Delimiter" },
  -- Haskell
  ["@function.haskell"] = {},
  ["@function.call.haskell"] = {},
  ["@constructor.haskell"] = {
    fg = gui0C,
    ctermfg = cterm0C,
  },
  -- Lua
  ["@lsp.mod.global.lua"] = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  ["@lsp.type.property.lua"] = {
    fg = gui0C,
    ctermfg = cterm0C,
  },
  ["@constant.lua"] = {
    fg = gui0C,
    ctermfg = cterm0C,
  },
  ["@keyword.return.lua"] = {
    fg = gui0C,
    ctermfg = cterm0C,
  },
  -- Ruby
  ["@lsp.typemod.namespace.declaration.ruby"] = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  ["@lsp.typemod.class.declaration.ruby"] = {
    fg = gui0C,
    ctermfg = cterm0C,
  },
  ["@comment.frozen.ruby"] = {
    fg = gui02,
    ctermfg = cterm02,
  },
  ["@constant.builtin.nil.ruby"] = {},
  ["@keyword.modifier.private.ruby"] = {
    cterm = { bold = true },
  },
  ["@string.ruby"] = {
    fg = gui0A,
    ctermfg = cterm0A,
  },
  ["@string_content.ruby"] = {
    fg = gui05,
    ctermfg = cterm05,
  },
  -- TypeScript
  ["@lsp.typemod.type.declaration.typescript"] = {
    fg = gui0C,
    ctermfg = cterm0C,
  },
  ["@lsp.type.type.typescript"] = {
    fg = gui0C,
    ctermfg = cterm0C,
  },
  ["@type.typescript"] = {
    fg = gui0C,
    ctermfg = cterm0C,
  },
  ["@lsp.type.interface.typescript"] = {
    fg = gui0C,
    ctermfg = cterm0C,
  },
  ["@lsp.type.class.typescript"] = {
    fg = gui0C,
    ctermfg = cterm0C,
  },
  ["@lsp.typemod.typeParameter.declaration.typescript"] = {
    fg = gui0E,
    ctermfg = cterm0E,
  },
  ["@punctuation.bracket.typescript"] = {
    fg = gui02,
    ctermfg = cterm02,
  },
  ["@punctuation.delimiter.typescript"] = {
    fg = gui02,
    ctermfg = cterm02,
  },
  ["@keyword.readonly.typescript"] = {
    cterm = {
      italic = true,
    },
  },
  -- GraphQL
  ["@punctuation.bracket.graphql"] = {
    fg = gui02,
    ctermfg = cterm02,
  },
  ["@type.graphql"] = {
    fg = gui0C,
    ctermfg = cterm0C,
  },
  -- Special compatibility for terminal
  Terminal = {
    link = "Normal",
  },
}) do
  vim.api.nvim_set_hl(0, group, settings)
end
