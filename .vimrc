" Set runtimepath
set runtimepath+=~/.env/.vim

" Look for Pathogen elsewhere
"runtime bundle/pathogen/autoload/pathogen.vim

execute pathogen#infect()
call pathogen#helptags()

source ~/.env/.vim/vimrc/settings.vim
source ~/.env/.vim/vimrc/looks.vim
source ~/.env/.vim/vimrc/mappings.vim
source ~/.env/.vim/vimrc/filetypes.vim
source ~/.env/.vim/vimrc/plugins.vim
source ~/.env/.vim/vimrc/functions.vim
