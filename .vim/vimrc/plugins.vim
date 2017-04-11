" Disable default snippets
let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }

" Enable compatibility with snipmate
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory = []
let g:neosnippet#snippets_directory += ['~/.env/.vim/bundle/vim-snippets/snippets']
let g:neosnippet#snippets_directory += ['~/.env/.vim/snippets']

" Mimic SuperTab snippets behavior
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Show hidden files in NERDTree
let NERDTreeShowHidden=1
let NERDTreeShowFiles=1

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

" Don't display these kind of files
let NERDTreeIgnore=['\.class$','\.o$','^\.git$','\.DS_Store','\.aux','.idr\~','.ibc','.prefab', '.meta']

" Hide noise from NERDTree
let NERDTreeMinimalUI = 1

" Change default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

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

" FZF
set rtp+=/usr/local/opt/fzf

" Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Display number of results inline
if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

" Redefine representation of warnings and errors
let g:ale_sign_error = '▌'
let g:ale_sign_warning = '▌'
highlight link ALEErrorSign DiffDelete
highlight link ALEWarningSign DiffDelete

let g:ale_lint_on_text_changed = 'normal' 

" Allow vim-surround to reindent code
let b:surround_indent = 1
