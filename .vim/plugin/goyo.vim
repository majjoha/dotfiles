function! s:goyo_enter()
set nu rnu
hi! LineNr ctermbg=bg
hi! CursorLineNr ctermbg=bg

if has('gui_running')
  set fullscreen
  set linespace=7
elseif exists('$TMUX')
  silent !tmux set status off
endif
endfunction

function! s:goyo_leave()
if has('gui_running')
  set nofullscreen
  set linespace=0
elseif exists('$TMUX')
  silent !tmux set status on
endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
