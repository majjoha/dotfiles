" Associate *.curly files with HTML
au BufRead,BufNewFile *.curly setfiletype html

" Associate *.md files with Markdown files
au BufRead,BufNewFile *.md set filetype=markdown

" Use spell checker for Markdown files and Git commit messages
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd FileType gitcommit setlocal spell spelllang=en_us
autocmd FileType tex setlocal spell spelllang=en_us

" Set text width to 80 for Markdown, LaTeX and Git commit messages.
autocmd BufRead,BufNewFile *.md set textwidth=80
autocmd FileType gitcommit set textwidth=80
autocmd FileType tex set textwidth=80

" Turn completion on for the following file types
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
