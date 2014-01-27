" Set runtimepath
set runtimepath+=~/.env/.vim

" Look for Pathogen elsewhere
"runtime bundle/pathogen/autoload/pathogen.vim

execute pathogen#infect()
call pathogen#helptags()

for f in split(glob('~/.env/.vim/vimrc/*.vim'), '\n')
  exe 'source' f
endfor
