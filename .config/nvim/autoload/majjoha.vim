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

  " Remove background color for fold column
  hi! link FoldColumn Normal

  " Set the color of the vertical split bar to transparent
  hi! VertSplit ctermbg=00

  " Show the current mode in a darker, non-bold font
  hi! ModeMsg ctermfg=08 cterm=NONE

  " Set the background of the status line in the current buffer to match the
  " color column, and the status line in all inactive buffers to transparent
  hi! StatusLine ctermbg=10
  hi! StatusLineNC ctermbg=00
endfunction

" Avoid opening FZF command in NERDTree
" See https://github.com/junegunn/fzf/issues/453#issuecomment-354634207
function! majjoha#FZFOpen(command_str) abort
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    silent exe "normal! \<c-w>\<c-w>"
  endif
  silent exe 'normal! ' . a:command_str . "\<cr>"
endfunction

function! majjoha#ShowGitBranch() abort
  let l:branchname =
    \ system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  return strlen(l:branchname) > 0 ? '   '.l:branchname.' |' : ''
endfunction
