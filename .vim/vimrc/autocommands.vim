" Usespell checker for prose, and code comments
augroup spell_checking
  autocmd!
  autocmd FileType markdown setlocal spell spelllang=en_us
  autocmd FileType gitcommit setlocal spell spelllang=en_us
  autocmd FileType tex setlocal spell spelllang=en_us
  autocmd FileType plaintex setlocal spell spelllang=en_us
  autocmd FileType go setlocal spell spelllang=en_us
augroup END

" Set text width to 80 for Markdown, LaTeX, and Git commit messages
augroup eighty_columns
  autocmd!
  autocmd FileType markdown set textwidth=80
  autocmd FileType gitcommit set textwidth=80
  autocmd FileType tex set textwidth=80
  autocmd FileType plaintex set textwidth=80
augroup END

" Enable completion for prose Markdown, LaTeX, and Git commit messages
augroup kspell_completion
  autocmd!
  autocmd FileType markdown set complete+=kspell
  autocmd FileType gitcommit set complete+=kspell
  autocmd FileType tex set complete+=kspell
  autocmd FileType plaintex set complete+=kspell
augroup END

" Enable Dictionary.app lookups from Markdown, LaTex, and Git commit messages
augroup dictionary
  autocmd!
  autocmd FileType markdown nnoremap K :silent !open dict:///<cword><cr>
  autocmd FileType gitcommit nnoremap K :silent !open dict:///<cword><cr>
  autocmd FileType tex nnoremap K :silent !open dict:///<cword><cr>
  autocmd FileType plaintex nnoremap K :silent !open dict:///<cword><cr>
augroup END

" Do not expand tabs in Makefiles
augroup makefiles
  autocmd!
  autocmd FileType make setlocal noexpandtab
augroup END

" Associate *.rkt files with Scheme
augroup racket
  autocmd!
  autocmd BufReadPost *.rkt,*.rktl set filetype=scheme
augroup END

" Fix Ruby docs in Neovim
augroup ruby_docs
  autocmd!
  autocmd FileType ruby nmap K :execute ':term ri '.expand("<cword>")<cr>
augroup END

" Configurations for Go development
augroup go
  autocmd!
  autocmd FileType go nmap K :GoDoc<cr>
  autocmd FileType go setlocal omnifunc=go#complete#Complete
  autocmd FileType go set completeopt-=preview
augroup END

" Set :help as keywordprg instead of man
augroup vim
  autocmd!
  autocmd FileType vim setlocal keywordprg=:help
augroup END

" Configurations for working with C# in Unity
augroup cs
  autocmd!
  autocmd FileType cs setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType cs set completeopt-=preview
  autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
  autocmd FileType cs nmap K :OmniSharpDocumentation<cr>
  autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
  autocmd FileType cs set updatetime=200
  autocmd BufWritePre *.cs :execute ':OmniSharpCodeFormat'
augroup END

" Resize splits when the window is rezied
augroup resize_splits
  autocmd!
  autocmd VimResized * exe "normal! \<c-w>="
augroup END

" Minor Git-related configurations
augroup git
  autocmd!
  " Auto-clean Fugitive buffers. Taken from:
  " http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
  autocmd BufReadPost fugitive://* set bufhidden=delete
  autocmd FileType gitcommit nnoremap <buffer><silent> cs :<C-U>Git stash<CR>
augroup END

" Redefine :Ag command to fix colors
augroup ag
  autocmd!
  autocmd VimEnter * command! -nargs=* Ag
    \ call fzf#vim#ag(<q-args>, '--color-path "1;33" --color-line-number "1;33"',
    \ fzf#vim#default_layout)
augroup END

" Run Neomake on save, and enter
augroup neomake
  autocmd!
  autocmd BufEnter,BufWritePost * Neomake
augroup END

" Use RSpec if a spec_helper.rb file is available
augroup neoterm_test_rspec
  autocmd!
  autocmd VimEnter,BufRead,BufNewFile *_spec.rb,*_feature.rb
    \ call neoterm#test#libs#add('rspec')
  autocmd VimEnter *
    \ if filereadable('spec/spec_helper.rb') |
    \   call neoterm#test#libs#add('rspec') |
    \ endif
augroup END
