" Skip if surround.vim is not loaded
if !exists("g:loaded_surround")
  finish
endif

" Allow vim-surround to reindent code
let b:surround_indent = 1
