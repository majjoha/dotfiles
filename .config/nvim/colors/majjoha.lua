local gui00 = "#f4efe7" -- palette 0
local gui01 = "#e3dbd0" -- palette 10
local gui02 = "#cbbda9" -- palette 11
local gui03 = "#2f2f2d" -- palette 8
local gui04 = "#555a63" -- palette 12
local gui05 = "#2f2f2d" -- palette 7
local gui06 = "#2b2722" -- palette 13
local gui07 = "#141310" -- palette 15
local gui08 = "#9f5032" -- palette 1
local gui09 = "#966d5d" -- palette 9
local gui0A = "#a38a6b" -- palette 3
local gui0B = "#7c7e44" -- palette 2
local gui0C = "#755943" -- palette 6
local gui0D = "#58657e" -- palette 4
local gui0E = "#9f8665" -- palette 5
local gui0F = "#6f6359" -- palette 14

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
  },
  NormalNC = {},
  Cursor = {
    fg = gui00,
    bg = gui05,
  },
  CursorLine = {},
  CursorColumn = {
    bg = gui01,
  },
  CursorLineNr = {
    fg = gui05,
  },
  LineNr = {
    fg = gui04,
  },
  lCursor = {},
  CursorIM = {},
  TermCursor = {},
  TermCursorNC = {},
  SignColumn = {
    bg = gui00,
  },
  ColorColumn = {
    bg = gui01,
  },
  MatchParen = {
    bg = gui03,
  },
  Conceal = {
    fg = gui0D,
    bg = gui00,
  },
  -- Editor interface
  -- Statuslines and tabs
  StatusLine = {
    bg = gui01,
    fg = gui05,
  },
  StatusLineNC = {
    bg = gui01,
    fg = gui03,
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
  },
  TabLineFill = {
    fg = gui0F,
    bg = gui01,
  },
  TabLineSel = {
    fg = gui05,
    bg = gui02,
  },
  WinSeparator = {
    fg = gui01,
  },
  WinBar = {},
  WinBarNC = {},
  -- Menu completion
  Pmenu = {
    fg = gui05,
    bg = gui01,
  },
  PmenuSel = {
    fg = gui05,
    bg = gui02,
  },
  PmenuMatch = {
    bold = true,
  },
  PmenuMatchSel = {
    fg = gui05,
    bg = gui02,
  },
  PmenuExtra = {},
  PmenuExtraSel = {
    fg = gui05,
    bg = gui02,
  },
  PmenuKind = {
    italic = true,
  },
  PmenuKindSel = {
    fg = gui05,
    bg = gui02,
    italic = true,
  },
  PmenuSbar = {},
  PmenuThumb = {},
  PmenuBorder = {
    fg = gui05,
    bg = gui00,
  },
  PmenuShadow = {},
  PmenuShadowThrough = {},
  ComplMatchIns = {},
  PreInsert = {},
  ComplHint = {},
  ComplHintMore = {},
  -- Floating windows
  FloatBorder = {
    fg = gui05,
    bg = gui00,
  },
  NormalFloat = {
    bg = gui00,
  },
  FloatTitle = {},
  FloatFooter = {},
  -- Other interface elements
  Directory = {
    fg = gui0D,
  },
  Title = {
    fg = gui0D,
  },
  Question = {
    fg = gui0D,
  },
  QuickFixLine = {
    bg = gui01,
  },
  EndOfBuffer = {},
  -- Message and status indicators
  ModeMsg = {
    fg = gui03,
  },
  MoreMsg = {
    fg = gui0B,
  },
  ErrorMsg = {
    fg = gui08,
    bg = gui00,
  },
  WarningMsg = {
    fg = gui08,
  },
  Error = {
    fg = gui00,
    bg = gui08,
  },
  Debug = {
    fg = gui08,
  },
  Exception = {
    fg = gui08,
  },
  Macro = {
    fg = gui08,
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
  },
  SpecialKey = {
    fg = gui03,
  },
  NonText = {
    fg = gui01,
  },
  Whitespace = {},
  Substitute = {
    fg = gui01,
    bg = gui0A,
  },
  IncSearch = {
    fg = gui05,
    bg = gui02,
  },
  CurSearch = {
    fg = gui05,
    bg = gui02,
  },
  Search = {
    bg = gui01,
  },
  TooLong = {
    fg = gui08,
  },
  WildMenu = {
    fg = gui08,
  },
  -- Folding and regions
  Folded = {
    fg = gui03,
    bg = gui00,
    italic = true,
  },
  FoldColumn = {
    link = "Normal",
  },
  Visual = {
    bg = gui01,
  },
  VisualNOS = {
    fg = gui08,
  },
  -- Standard syntax highlighting
  Comment = {
    fg = gui05,
    italic = true,
  },
  String = {
    fg = gui05,
  },
  Number = {
    fg = gui05,
  },
  Boolean = {
    fg = gui05,
  },
  Constant = {
    fg = gui05,
  },
  Character = {
    fg = gui05,
  },
  Float = {
    fg = gui05,
  },
  Identifier = {
    fg = gui05,
  },
  Function = {
    fg = gui05,
  },
  Keyword = {
    fg = gui03,
  },
  Statement = {
    fg = gui05,
  },
  Conditional = {
    fg = gui05,
  },
  Repeat = {
    fg = gui05,
  },
  Label = {
    fg = gui05,
  },
  Include = {
    fg = gui05,
  },
  Define = {
    fg = gui05,
  },
  PreProc = {
    fg = gui05,
  },
  Type = {
    fg = gui0E,
  },
  Typedef = {
    fg = gui0D,
  },
  Structure = {
    fg = gui0E,
  },
  Delimiter = {
    fg = gui0A,
  },
  Operator = {
    fg = gui03,
  },
  Special = {
    fg = gui05,
  },
  SpecialChar = {
    fg = gui05,
  },
  Tag = {
    fg = gui05,
  },
  Todo = {
    fg = gui0A,
    bg = gui01,
  },
  StorageClass = {
    fg = gui05,
  },
  Ignore = {},
  -- Spelling
  SpellBad = {
    fg = gui08,
    undercurl = true,
  },
  SpellLocal = {
    bg = gui00,
    undercurl = true,
  },
  SpellCap = {
    fg = gui08,
    undercurl = true,
  },
  SpellRare = {
    bg = gui00,
    undercurl = true,
  },
  -- Diagnostics
  DiagnosticSignError = {
    fg = gui08,
    bg = gui00,
  },
  DiagnosticSignWarn = {
    fg = gui0A,
    bg = gui00,
  },
  DiagnosticSignHint = {
    fg = gui05,
    bg = gui00,
  },
  DiagnosticSignInfo = {
    fg = gui05,
    bg = gui00,
  },
  DiagnosticVirtualLinesError = {
    fg = gui03,
    bg = gui00,
  },
  DiagnosticVirtualLinesWarn = {
    fg = gui03,
    bg = gui00,
  },
  DiagnosticVirtualLinesHint = {
    fg = gui03,
    bg = gui00,
  },
  DiagnosticVirtualLinesInfo = {
    fg = gui03,
    bg = gui00,
  },
  DiagnosticVirtualLinesOk = {
    fg = gui03,
    bg = gui00,
  },
  DiagnosticFloatingError = {
    fg = gui03,
    bg = gui00,
  },
  DiagnosticFloatingWarn = {
    fg = gui03,
    bg = gui00,
  },
  DiagnosticFloatingHint = {
    fg = gui03,
    bg = gui00,
  },
  DiagnosticFloatingInfo = {
    fg = gui03,
    bg = gui00,
  },
  DiagnosticFloatingOk = {
    fg = gui03,
    bg = gui00,
  },
  DiagnosticUnderlineError = {
    undercurl = true,
  },
  DiagnosticUnderlineWarn = {
    undercurl = true,
  },
  DiagnosticUnderlineHint = {
    undercurl = true,
  },
  DiagnosticUnderlineInfo = {
    undercurl = true,
  },
  DiagnosticUnderlineOk = {
    undercurl = true,
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
  },
  DiffChange = {
    fg = gui03,
    bg = gui01,
  },
  DiffDelete = {
    fg = gui08,
    bg = gui01,
  },
  DiffText = {
    fg = gui0D,
    bg = gui01,
  },
  DiffAdded = {
    fg = gui0B,
    bg = gui00,
  },
  DiffFile = {
    fg = gui08,
    bg = gui00,
  },
  DiffNewFile = {
    fg = gui0B,
    bg = gui00,
  },
  DiffLine = {
    fg = gui0D,
    bg = gui00,
  },
  DiffRemoved = {
    fg = gui08,
    bg = gui00,
  },
  Added = {},
  Changed = {},
  Removed = {},
  ["@text.diff.delete"] = {
    fg = gui08,
    bg = gui00,
  },
  ["@text.diff.add"] = {
    fg = gui0B,
    bg = gui00,
  },
  ["@diff.plus.diff"] = {
    fg = gui0B,
    bg = gui00,
  },
  ["@diff.minus.diff"] = {
    fg = gui08,
    bg = gui00,
  },
  ["jjAdded"] = {
    fg = gui0B,
    bg = gui00,
  },
  gitcommitOverflow = {
    fg = gui08,
  },
  gitcommitSummary = {
    fg = gui0B,
  },
  gitcommitComment = {
    fg = gui03,
  },
  gitcommitUntracked = {
    fg = gui03,
  },
  gitcommitDiscarded = {
    fg = gui03,
  },
  gitcommitSelected = {
    fg = gui03,
  },
  gitcommitHeader = {
    fg = gui0E,
  },
  gitcommitSelectedType = {
    fg = gui0D,
  },
  gitcommitUnmergedType = {
    fg = gui0D,
  },
  gitcommitDiscardedType = {
    fg = gui0D,
  },
  gitcommitBranch = {
    fg = gui09,
    bold = true,
  },
  gitcommitUntrackedFile = {
    fg = gui0A,
  },
  gitcommitUnmergedFile = {
    fg = gui08,
    bold = true,
  },
  gitcommitDiscardedFile = {
    fg = gui08,
    bold = true,
  },
  gitcommitSelectedFile = {
    fg = gui0B,
    bold = true,
  },
  -- Plugin-specific highlighting
  MiniFilesBorder = {
    fg = gui01,
  },
  OtherSelector = {
    fg = gui01,
  },
  OtherUnderlined = {
    fg = gui05,
  },
  -- Treesitter/LSP
  LspReferenceText = {
    underline = true,
    sp = "#a28752",
  },
  ["@lsp.type.namespace"] = { link = "@namespace", default = true },
  ["@lsp.type.type"] = { link = "@type", default = true },
  ["@lsp.type.class"] = { link = "@type", default = true },
  ["@lsp.type.enum"] = { link = "@type", default = true },
  ["@lsp.type.interface"] = { link = "@type", default = true },
  ["@lsp.type.struct"] = { link = "@struct", default = true },
  ["@lsp.type.parameter"] = { link = "@parameter", default = true },
  ["@lsp.type.typeParameter"] = { link = "@type", default = true },
  ["@lsp.type.variable"] = { link = "@variable", default = true },
  ["@lsp.type.property"] = { link = "@property", default = true },
  ["@lsp.type.enumMember"] = { link = "@constant", default = true },
  ["@lsp.type.function"] = { link = "@function", default = true },
  ["@lsp.type.method"] = { link = "@method", default = true },
  ["@lsp.type.macro"] = { link = "Macro", default = true },
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
  },
  -- Lua
  ["@lsp.mod.global.lua"] = {
    fg = gui0E,
  },
  ["@lsp.type.property.lua"] = {
    fg = gui0C,
  },
  ["@constant.lua"] = {
    fg = gui0C,
  },
  ["@keyword.return.lua"] = {
    fg = gui0C,
  },
  -- Elixir
  ["@module.elixir"] = {
    fg = gui0E,
  },
  ["@type.elixir"] = {
    fg = gui0E,
  },
  -- Ruby
  ["@lsp.typemod.namespace.declaration.ruby"] = {
    fg = gui0E,
  },
  ["@lsp.typemod.class.declaration.ruby"] = {
    fg = gui0C,
  },
  ["@comment.frozen.ruby"] = {
    fg = gui02,
  },
  ["@constant.builtin.nil.ruby"] = {},
  ["@keyword.modifier.private.ruby"] = {
    bold = true,
  },
  ["@string.ruby"] = {
    fg = gui0A,
  },
  ["@string_content.ruby"] = {
    fg = gui05,
  },
  -- TypeScript
  ["@lsp.typemod.type.declaration.typescript"] = {
    fg = gui0C,
  },
  ["@lsp.type.type.typescript"] = {
    fg = gui0C,
  },
  ["@type.typescript"] = {
    fg = gui0C,
  },
  ["@lsp.type.interface.typescript"] = {
    fg = gui0C,
  },
  ["@lsp.type.class.typescript"] = {
    fg = gui0C,
  },
  ["@lsp.typemod.typeParameter.declaration.typescript"] = {
    fg = gui0E,
  },
  ["@punctuation.bracket.typescript"] = {
    fg = gui02,
  },
  ["@punctuation.delimiter.typescript"] = {
    fg = gui02,
  },
  ["@keyword.readonly.typescript"] = {
    italic = true,
  },
  -- GraphQL
  ["@punctuation.bracket.graphql"] = {
    fg = gui02,
  },
  ["@type.graphql"] = {
    fg = gui0C,
  },
  -- Special compatibility for terminal
  Terminal = {
    link = "Normal",
  },
}) do
  vim.api.nvim_set_hl(0, group, settings)
end
