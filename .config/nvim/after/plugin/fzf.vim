" Skip if FZF is not loaded
if !exists("g:loaded_fzf")
  finish
endif

" Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Display the search window at the bottom instead of in a floating window
let g:fzf_layout = { 'down': '40%' }

" Include hidden directories when searching
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

" Display number of results inline
let $FZF_DEFAULT_OPTS .= ' --inline-info'

" Hide status line of terminal buffer
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Show a preview window when searching files
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Allow `ripgrep` to search hidden files and show a preview window
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg
  \     --column
  \     --line-number
  \     --no-heading
  \     --color=always
  \     --smart-case
  \     --hidden '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
