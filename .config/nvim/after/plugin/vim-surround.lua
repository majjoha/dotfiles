-- Skip if `surround.vim` is not loaded
if not vim.g.loaded_surround then
  return
end

-- Allow `surround.vim` to reindent code
vim.g.surround_indent = 1
