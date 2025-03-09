local actions = require("fzf-lua.actions")

require("fzf-lua").setup({
  winopts = {
    height = 0.7,
    width = 0.9,
    border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
    preview = { horizontal = "right:50%", title = false, layout = "horizontal" },
  },
  fzf_opts = { ["--inline-info"] = "", ["--reverse"] = "" },
  fzf_colors = {
    bg = { "bg", "Normal" },
    fg = { "fg", "Normal" },
    hl = { "fg", "StatusLineNC" },
    ["bg+"] = { "bg", "StatusLine" },
    ["fg+"] = { "fg", "Normal" },
    ["hl+"] = { "fg", "StatusLine" },
    border = { "fg", "LineNr" },
    gutter = { "bg", "Normal" },
    header = { "fg", "Comment" },
    info = { "fg", "StatusLine" },
    marker = { "fg", "Normal" },
    pointer = { "fg", "Normal" },
    prompt = { "fg", "LineNr" },
    spinner = { "fg", "Normal" },
  },
  buffers = { actions = { ["ctrl-d"] = { actions.buf_del, actions.resume } } },
  grep = {
    rg_opts = "--column --line-number --no-heading --color=always --smart-case --hidden",
  },
  keymap = {
    builtin = { ["<S-K>"] = "preview-page-up", ["<S-J>"] = "preview-page-down" },
  },
  files = {
    rg_opts = "--color=never --files --hidden --no-ignore --follow --glob '!*/**/*.png' --glob '!*/**/.jpg'",
  },
  lsp = {
    code_actions = {
      previewer = "codeaction_native",
      preview_pager = "delta --side-by-side --width=$FZF_PREVIEW_COLUMNS --hunk-header-style='omit' --file-style='omit'",
    },
  },
})
