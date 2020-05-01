" Skip if test.vim is not loaded
if !exists("g:loaded_test")
  finish
endif

" Use neovim strategy for vim-test
let test#strategy = "neovim"
