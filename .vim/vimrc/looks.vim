" Set theme
colorscheme base16-eighties
if $ITERM_PROFILE == "Light"
  set background=light
else
  set background=dark
endif

" Set relative line numbering
set nu
set rnu

" Set color column to 80
set colorcolumn=80

set ttyfast
set lazyredraw

" Blend vertical separator, and line numbers.
set fillchars=vert:\ 
set highlight+=c:LineNr
