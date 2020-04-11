" Automatic, language-dependent indentation, syntax coloring and other
" functionality
filetype indent plugin on

" Set auto indentation
set autoindent

" Set indentation
set smartindent

" Set syntax highlighting on
syntax on

" Set the Terminal title
set title

" Highlight search terms dynamically as they are typed
set hlsearch incsearch

" Auto read when a file is changed from the outside
set autoread

" No annoying sound on errors
set noerrorbells visualbell t_vb=

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

" Ignore case for files in `:cd`
set fileignorecase

" Assume fast terminal
set ttyfast
set lazyredraw

" Use one space instead of two when joining lines
set nojoinspaces

" Disable intro message
set shortmess+=I

" Delete comment character when joining commented lines
set formatoptions+=j

if has('nvim')
  " Show the effects of a command incrementally as you type
  set inccommand=nosplit
endif

" Show spell suggestions in a smaller window
set spellsuggest=15

" Set path to tags
set tags+=.git/tags;

" Allow more than one unsaved buffer
set hidden
