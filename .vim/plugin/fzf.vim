" Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Display number of results inline
if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

" Hide status line of terminal buffer
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
