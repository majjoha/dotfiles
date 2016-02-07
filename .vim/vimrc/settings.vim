set nocompatible
filetype on
filetype plugin on

" Set auto indentation
set ai

" Set indentation
set si

" Set syntax highlighting on
syntax on

" Set file indentation on
filetype indent on

" Use 256 colors
set t_Co=256

" Set the Terminal title
set title

" Highlight search terms
set hlsearch

" dynamically as they are typed
set incsearch

" Auto read when a file is changed from the outside
set autoread

" No annoying sound on errors
set noeb vb t_vb=

" Set UTF-8 as standard encoding
if !has('nvim')
  set encoding=utf-8
endif

" Use spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Share the unnamed paste buffer with the system clipboard
set clipboard=unnamed

" Disable swap files creation
set noswapfile

" Delete using backspace
set backspace=indent,eol,start

" Set split to right or below
set splitbelow
set splitright

" Completion
set completeopt=longest,menuone

" Set mouse to help others who aren't familiar with vim
set mouse=a

" Allow per project .vimrc
set exrc

" Use round number for indenting
set shiftround

" Use different cursors for insert and normal mode
if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif
