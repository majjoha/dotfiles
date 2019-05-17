" Set packpath and runtimepath
set packpath+=~/.vim
set runtimepath+=~/.vim,/usr/local/opt/fzf,~/.vim/after

" Source all configuration files
for f in split(glob('~/.vim/vimrc/*.vim'), '\n')
  exe 'source' f
endfor
