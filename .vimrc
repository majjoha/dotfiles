" Set runtimepath
set runtimepath+=~/.env/.vim

execute pathogen#infect()
call pathogen#helptags()

for f in split(glob('~/.env/.vim/vimrc/*.vim'), '\n')
  exe 'source' f
endfor
