" Skip if FZF is not loaded
if !exists("g:loaded_fzf")
  finish
endif

" Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Include hidden directories when searching
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

" Place the search field in the top, and display the number of results next to
" it
let $FZF_DEFAULT_OPTS = '--inline-info --reverse'

" Redefine color scheme for FZF
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'StatusLineNC'],
  \ 'fg+':     ['fg', 'Normal'],
  \ 'bg+':     ['bg', 'StatusLine'],
  \ 'hl+':     ['fg', 'StatusLine'],
  \ 'gutter':  ['bg', 'Normal'],
  \ 'info':    ['fg', 'StatusLine'],
  \ 'border':  ['fg', 'LineNr'],
  \ 'prompt':  ['fg', 'LineNr'],
  \ 'pointer': ['fg', 'Normal'],
  \ 'marker':  ['fg', 'Normal'],
  \ 'spinner': ['fg', 'Normal'],
  \ 'header':  ['fg', 'Comment']
  \ }

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
