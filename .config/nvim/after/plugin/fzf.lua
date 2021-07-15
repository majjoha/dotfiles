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
vim.env.FZF_DEFAULT_OPTS = "--inline-info --reverse"

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
vim.api.nvim_command([[
  command! -bang -nargs=* Rg
    call fzf#vim#grep("
      rg --column --line-number --no-heading --color=always --smart-case --hidden " . shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
]])
