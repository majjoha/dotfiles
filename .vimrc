" Set runtimepath
set runtimepath+=~/.env/.vim,/usr/local/opt/fzf

" Initialize pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim

execute pathogen#infect()
call pathogen#helptags()

" Source all configuration files
for f in split(glob('~/.env/.vim/vimrc/*.vim'), '\n')
  exe 'source' f
endfor

" Color current line number
hi CursorLineNr ctermfg=13
