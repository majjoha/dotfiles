" Use spell checker for Markdown files and Git commit messages
augroup spell_checking
  autocmd!
  autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
  autocmd FileType gitcommit setlocal spell spelllang=en_us
  autocmd FileType tex setlocal spell spelllang=en_us
  autocmd FileType plaintex setlocal spell spelllang=en_us
  autocmd FileType vimwiki setlocal spell spelllang=en_us
augroup END

" Set text width to 80 for Markdown, LaTeX and Git commit messages.
augroup eighty_columns
  autocmd!
  autocmd FileType markdown set textwidth=80
  autocmd FileType gitcommit set textwidth=80
  autocmd FileType tex set textwidth=80
  autocmd FileType plaintex set textwidth=80
  autocmd FileType vimwiki set textwidth=80
augroup END

" Turn completion on for the following file types
augroup code_completion
  autocmd!
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
augroup END

augroup makefiles
  autocmd!
  autocmd FileType make setlocal noexpandtab
augroup END

augroup racket
  autocmd!
  " Associate .rkt files with Scheme
  autocmd BufReadPost *.rkt,*.rktl set filetype=scheme
augroup END

augroup css
  autocmd!
  " Comb CSS on save
  autocmd BufWritePre,FileWritePre *.css,*.less,*.scss,*.sass silent! :CSScomb
augroup END

" Activation based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme,javascript RainbowParentheses
augroup END
