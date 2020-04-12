" Open the current buffer in a new tab
function majjoha#OpenCurrentAsNewTab() abort
  let l:currentPos = getcurpos()
  tabedit %
  call setpos(".", l:currentPos)
endfunction

" Change color variables
function! majjoha#CustomizeColors() abort
  " Highlight current line number
  hi! CursorLineNr ctermfg=13

  " Remove tilde character at the end of buffer
  hi! EndOfBuffer ctermbg=bg ctermfg=bg

  " Remove background color for fold column
  hi! link FoldColumn Normal
endfunction

" Avoid opening FZF command in NERDTree
" See https://github.com/junegunn/fzf/issues/453#issuecomment-354634207
function! majjoha#FZFOpen(command_str) abort
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction
