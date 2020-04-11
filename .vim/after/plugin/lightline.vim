let g:lightline = {
\ 'colorscheme': '16color',
\ 'active': {
\   'left': [ [ 'mode'],
\             [ 'fugitive' ],
\             [ 'relativepath', 'modified' ] ],
\   'right': [ [ 'percent', 'lineinfo' ],
\              [ ],
\              [ 'filetype' ] ]
\ },
\ 'component': {
\   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
\ },
\ 'component_function': {
\   'mode': 'LightLineMode',
\   'fugitive': 'LightLineFugitive',
\   'percent': 'LightLinePercent',
\   'lineinfo': 'LightLineInfo',
\   'filetype': 'LightLineFiletype',
\   'relativepath': 'LightLineFilename'
\ },
\ 'component_visible_condition': {
\   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
\ },
\ 'mode_map': {
\   'n' : 'N',
\   'i' : 'I',
\   'R' : 'R',
\   'v' : 'V',
\   'V' : 'V',
\   "\<C-v>": 'V',
\   'c' : 'C',
\   's' : 'S',
\   'S' : 'S',
\   "\<C-s>": 'S',
\   't': 'T',
\   '?': ''
\ },
\ 'subseparator': { 'left': '│', 'right': "" }
\ }

let s:skip_filetypes = 'nerdtree\|fugitiveblame\|fzf'

function! LightLineMode()
  return &ft =~? s:skip_filetypes ? '' : lightline#mode()
endfunction

function! LightLineFugitive()
  if &ft =~? s:skip_filetypes
    return ''
  endif
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

function! LightLinePercent()
  return &ft =~? s:skip_filetypes ? '' :
    \ expand('%') =~? 'term:/\/' ? '' :
		\ printf('%3.0f%%', (100 * line('.') / line('$')))
endfunction

function! LightLineInfo()
  return &ft =~? s:skip_filetypes ? '' :
    \ expand('%') =~? 'term:/\/' ? '' :
    \ printf("%3d:%-2d", line('.'), col('.'))
endfunction

function! LightLineFiletype()
  return &ft =~? s:skip_filetypes ? '' :
    \ (strlen(&filetype) ? &filetype : 'no ft')
endfunction

function! LightLineFilename()
  let fname = expand('%')
  if mode() == 't'
    return ''
  endif

  return &ft =~? 'nerdtree' ? expand('%') :
    \ &ft =~? 'fugitiveblame' ? expand('%:t') :
    \ expand('%') =~? 'term:\/\/' ? substitute(expand('%'), 'term:\/\/.\/\/\d*:', '', 'g') :
    \ ('' != fname ? fname : '[No Name]')
endfunction
