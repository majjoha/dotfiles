" Resize splits when the window is rezied
augroup resize_splits
  autocmd!
  autocmd VimResized * exe "normal! \<c-w>="
augroup END

" Auto-clean Fugitive buffers. Taken from:
" http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
augroup git
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

" Remove line numbers in terminal mode and start it in insert mode
augroup terminal_mode
  autocmd!
  autocmd TermOpen * setlocal nonu nornu
  autocmd TermOpen * startinsert
augroup END

" Customize colors.
" See https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
augroup customize_colors
    autocmd!
    autocmd ColorScheme * call majjoha#CustomizeColors()
augroup END
