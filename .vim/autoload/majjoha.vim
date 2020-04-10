" Maximize current window
if exists('g:open_current_as_new_tab') || &compatible
  finish
endif
let g:open_current_as_new_tab = 1

function majjoha#OpenCurrentAsNewTab() abort
  let l:currentPos = getcurpos()
  tabedit %
  call setpos(".", l:currentPos)
endfunction

" Change color variables
if exists('g:customize_colors') || &compatible
  finish
endif
let g:customize_colors = 1

function! majjoha#CustomizeColors() abort
  " Highlight current line number
  hi! CursorLineNr ctermfg=13

  " Remove tilde character at the end of buffer
  hi! EndOfBuffer ctermbg=bg ctermfg=bg

  " Remove background color for fold column
  hi! link FoldColumn Normal
endfunction
