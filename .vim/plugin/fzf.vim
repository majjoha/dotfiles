" Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Include hidden directories when searching
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

" Display number of results inline
if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

" Hide status line of terminal buffer
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
