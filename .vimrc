" Set `runtimepath` and `packpath` for Neovim compatibility
if has("nvim")
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath = &runtimepath
endif

" Add FZF to the `runtimepath`
set runtimepath+=/usr/local/opt/fzf
