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

augroup markdown
  autocmd!
  autocmd FileType markdown nnoremap K :silent !open dict:///<cword><cr>
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
  autocmd FileType lisp,clojure,scheme,javascript,ruby RainbowParentheses
augroup END

augroup last_modified
  autocmd!
  " If buffer modified, update any 'Last modified: ' paragraph.
  " 'Last modified: ' can have up to 10 characters before (they are retained).
  " Restores cursor, and window position using save_cursor variable.
  function! LastModified()
    if &modified
      let save_cursor = getpos(".")
      let n = min([line("$"), line("$")])
      keepjumps exe '1,' . n . 's#^\(.\{,10}Last modified: \).*#\1' .
        \ strftime('%A, %b %d, %Y, %H:%M.') . '#e'
      call histdel('search', -1)
      call setpos('.', save_cursor)
    endif
  endfun
  autocmd BufWritePre *.wiki call LastModified()
augroup END

" Fix Ruby docs in Neovim
augroup ruby_docs
  autocmd!
  autocmd FileType ruby nmap K :execute ':term ri '.expand("<cword>")<cr>
augroup END
