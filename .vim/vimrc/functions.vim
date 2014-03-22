if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

augroup qfgrep
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
augroup END

