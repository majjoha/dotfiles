-- Skip if FZF is not loaded
if not vim.g.loaded_fzf then
  return
end

-- Jump to the existing window if possible
vim.g.fzf_buffers_jump = 1

-- Include hidden directories when searching
vim.env.FZF_DEFAULT_COMMAND = "rg --files --hidden"

-- Place the search field in the top, and display the number of results next to
-- it
vim.env.FZF_DEFAULT_OPTS =
  "--inline-info --reverse --preview-window border-left"

vim.g.fzf_layout = { window = { width = 0.9, height = 0.7, border = "sharp" } }

-- Redefine color scheme for FZF
vim.g.fzf_colors = {
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
}

-- Allow `ripgrep` to search hidden files and show a preview window
vim.api.nvim_create_user_command("Rg", function(args)
  vim.fn["fzf#vim#grep"](string.format([[
      rg --column --line-number --no-heading --color=always --smart-case --hidden %s
    ]], vim.fn.shellescape(args.args)), 1, vim.fn["fzf#vim#with_preview"](), 0)
end, { bang = true, nargs = "*" })
