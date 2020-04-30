" Set theme
let g:colors_name = "base16"
set background=dark

" Enable relative line numbering
set number
set relativenumber

" Set color column to 80
set colorcolumn=80

" Always show the status line
set laststatus=2

" Blend vertical separator and line numbers
set fillchars=vert:\ 

" Supress the `~` character at the end of the buffer
if has('nvim')
  set fillchars+=eob:\ 
endif

" Show the current mode
set showmode

" Do not display key strokes
set noshowcmd
