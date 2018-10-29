" Set packpath and runtimepath
set packpath+=~/.env/.vim
set runtimepath+=~/.env/.vim,/usr/local/opt/fzf,~/.env/.vim/after

" Source all configuration files
for f in split(glob('~/.env/.vim/vimrc/*.vim'), '\n')
  exe 'source' f
endfor
