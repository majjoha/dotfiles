" Automatic, language-dependent indentation, syntax coloring and other
" functionality
filetype indent plugin on

" Maintain the indentation of the current line
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

" Disable sound on errors
set noerrorbells visualbell t_vb=

" Use spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Share the unnamed paste buffer with the system clipboard
set clipboard=unnamed

" Disable swapfiles
set noswapfile

" Delete using backspace
set backspace=indent,eol,start

" Open split windows below and to the right of the current window
set splitbelow
set splitright

" Show the popup menu even if there is only one match and insert only the
" longest common text of the matches
set completeopt=longest,menuone

" Allow the mouse in all modes
set mouse=a

" Allow per project `.vimrc`
set exrc

" Disable shell execution and write options
set secure

" Round indent to multiple of `shiftwidth`
set shiftround

" Ignore case sensitivity, so `foo` matches foo, Foo, and FOO
set ignorecase

" But Foo should only match Foo
set smartcase

" Adjust case sensitivity of match depending on the typed text
set infercase

" Ignore case sensitivity for files in `:cd`
set fileignorecase

" Assume fast terminal
set ttyfast
set lazyredraw

" Use one space instead of two when joining lines
set nojoinspaces

" Disable the intro message
set shortmess+=I

" Delete the comment character when joining commented lines
set formatoptions+=j

if has('nvim')
  " Show the effects of a command incrementally as you type
  set inccommand=nosplit
endif

" Show spell suggestions in a smaller window
set spellsuggest=15

" Look for tags in `.git/tags`
set tags+=.git/tags;

" Allow more than one unsaved buffer
set hidden

" Allow the cursor to move where there is no text in visual select mode
set virtualedit=block

" Store undo history
set undofile
set undodir=~/.vim/undo
