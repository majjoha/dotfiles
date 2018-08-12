augroup csharp
  autocmd!
  " Show type under cursor
  " autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
augroup END

augroup resize_splits
  autocmd!
  " Resize splits when the window is rezied
  autocmd VimResized * exe "normal! \<c-w>="
augroup END

augroup git
  autocmd!
  " Auto-clean Fugitive buffers. Taken from:
  " http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

augroup terminal_mode
  autocmd!
  " Remove line numbers in terminal mode
  autocmd TermOpen * setlocal nonu nornu
  " Start terminal in insert mode
  autocmd TermOpen * startinsert
augroup END

augroup auto_fzf
  autocmd!
  " Open FZF if vim starts without a file
  " autocmd StdinReadPre * let s:std_in=1
  " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'Files' | endif
augroup END
