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
set completeopt=longest,menuone,preview

" Set mouse to help others who aren't familiar with vim
set mouse=a

" Allow per project .vimrc
set exrc

" Disable shell execution, and write options
set secure

" Use round number for indenting
set shiftround

" Ignore case, so `foo` matches foo, Foo, and FOO
set ignorecase

" But Foo should only match Foo
set smartcase

" Adjust case of match depending on the typed text
set infercase

" Assume fast terminal
set ttyfast
set lazyredraw

if has('nvim')
  " Use different cursors for insert and normal mode
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

  " Show the effects of a command incrementally as you type
  set inccommand=nosplit
endif
