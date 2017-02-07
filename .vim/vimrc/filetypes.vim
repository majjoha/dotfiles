" Use spell checker for Markdown, LaTeX, and Git commit messages
augroup spell_checking
  autocmd!
  autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
  autocmd FileType gitcommit setlocal spell spelllang=en_us
  autocmd FileType tex setlocal spell spelllang=en_us
  autocmd FileType plaintex setlocal spell spelllang=en_us
augroup END

" Set text width to 80 for Markdown, LaTeX and Git commit messages
augroup eighty_columns
  autocmd!
  autocmd FileType markdown set textwidth=80
  autocmd FileType gitcommit set textwidth=80
  autocmd FileType tex set textwidth=80
  autocmd FileType plaintex set textwidth=80
augroup END

" Enable Dictionary.app lookups from Markdown, LaTex, and Git commit messages
augroup dictionary
  autocmd!
  autocmd FileType markdown nnoremap K :silent !open dict:///<cword><cr>
  autocmd FileType gitcommit nnoremap K :silent !open dict:///<cword><cr>
  autocmd FileType tex nnoremap K :silent !open dict:///<cword><cr>
  autocmd FileType plaintex nnoremap K :silent !open dict:///<cword><cr>
augroup END

augroup makefiles
  autocmd!
  autocmd FileType make setlocal noexpandtab
augroup END

" Associate *.rkt files with Scheme
augroup racket
  autocmd!
  autocmd BufReadPost *.rkt,*.rktl set filetype=scheme
augroup END

" Enable rainbow parentheses for Lisp, Clojure, JavaScript, and Ruby
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme,javascript,ruby RainbowParentheses
augroup END

" Fix Ruby docs in Neovim
augroup ruby_docs
  autocmd!
  autocmd FileType ruby nmap K :execute ':term ri '.expand("<cword>")<cr>
augroup END

" Various mappings for Go development
augroup go
  autocmd!
  autocmd FileType go nmap K :GoDoc<cr>
  autocmd FileType go setlocal omnifunc=go#complete#Complete
  autocmd FileType go set completeopt-=preview
augroup END
