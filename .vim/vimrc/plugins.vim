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

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Show hidden files in NERDTree
let NERDTreeShowHidden=1
let NERDTreeShowFiles=1

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

" Don't display these kind of files
let NERDTreeIgnore=['\.class$','\.o$','^\.git$','\.DS_Store','\.aux','.idr\~','.ibc']

" Hide noise from NERDTree
let NERDTreeMinimalUI = 1

" Set statusline
set laststatus=2

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
set rtp+=~/.env/bin/fzf

" Redefine :Ag command to fix colors
autocmd VimEnter * command! -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, '--color-path "1;33" --color-line-number "1;33"',
  \ fzf#vim#default_layout)

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Display number of results inline
if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

" Run Neomake on save, and enter
" autocmd! BufEnter,BufWritePost * Neomake

" Redefine representation of warnings and errors
let g:neomake_error_sign = {
  \ 'text': '●',
  \ 'texthl': 'DiffDelete'
  \ }

let g:neomake_warning_sign = {
  \ 'text': '●',
  \ 'texthl': 'DiffDelete'
  \ }

" Auto-clean Fugitive buffers. Taken from:
" http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
autocmd BufReadPost fugitive://* set bufhidden=delete

" Set up tests for RSpec in Docker
function! neoterm#test#rspec#run(scope)
  let command = match(expand('%:p'), 'knowledge_api') == -1 ?
    \ 'bundle exec rspec' : 'zdi knowledge_api -d run bundle exec rspec'

  if a:scope == 'file'
    let command .= ' ' . expand('%')
  elseif a:scope == 'current'
    let command .= ' ' . expand('%') . ':' . line('.')
  endif

  return command
endfunction

aug neoterm_test_rspec
  au VimEnter,BufRead,BufNewFile *_spec.rb,*_feature.rb call neoterm#test#libs#add('rspec')
  au VimEnter *
        \ if filereadable('spec/spec_helper.rb') |
        \   call neoterm#test#libs#add('rspec') |
        \ endif
aug END

let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

" Export vimwiki to HTML automatically
let g:vimwiki_list = [{
  \ 'path_html': '~/.vimwiki_html/',
  \ 'auto_export': 1,
  \ 'nested_syntaxes': {'ruby': 'ruby', 'js': 'javascript'},
  \ 'template_path': '~/.vimwiki_html/',
  \ 'template_default': 'default'}]

" Allow vim-surround to reindent code
let b:surround_indent = 1
