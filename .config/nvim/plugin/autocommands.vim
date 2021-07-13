" Resize splits when the window is rezied
augroup resize_splits
  autocmd!
  autocmd VimResized * execute "normal! \<c-w>="
augroup END

" Auto-clean Fugitive buffers. Taken from:
" http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
augroup git
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

" Remove line numbers in terminal mode, start it in insert mode and delete the
" buffer when it is no longer displayed
augroup terminal_mode
  autocmd!

  autocmd TermOpen * setlocal nonumber norelativenumber
  autocmd TermOpen * startinsert
  autocmd TermLeave term://* set bufhidden=delete
augroup END

" Customize colors
" See https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
augroup customize_colors
  autocmd!
  autocmd ColorScheme * lua require("majjoha").customize_colors()
augroup END

" Highlight current file in NvimTree, and set status line to NvimTree
" See https://github.com/kyazdani42/nvim-tree.lua/issues/322
augroup nvimtree
  autocmd!
  autocmd BufEnter NvimTree setlocal cursorline
  autocmd BufEnter NvimTree setlocal statusline=\ \ %{expand('%:p:h:t')}
augroup END
