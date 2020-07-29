" Include `!` and `?` when deleting words
setlocal iskeyword+=!,?

" Open `ri` in a terminal
setlocal keywordprg=:term\ ri

" Do not add `#` on a new line when hitting `o` on a commented line
setlocal formatoptions-=o
