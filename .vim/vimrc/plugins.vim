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
let NERDTreeIgnore=['\.class$','\.o$','^\.git$','\.DS_Store','\.aux']

" Hide noise from NERDTree
let NERDTreeMinimalUI = 1

" Set statusline
set laststatus=2

let g:lightline = {
  \ 'colorscheme': '16color',
  \ 'active': {
  \   'left': [ [ 'mode'],
  \             [ 'fugitive', 'relativepath', 'modified' ] ]
  \ },
  \ 'component': {
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
  \ },
  \ 'component_function': {
  \   'fugitive': 'LightLineFugitive'
  \ },
  \ 'component_visible_condition': {
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '│', 'right': '' }
  \ }

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

" Ignore binary files
" TODO: Can we perhaps live without the following?
" set wildignore+=tags,*.DS_Store,*.o,*.obj,.git,*.class,*.png,*.jpg,*.jpeg,*.gif,*.ico,*.pdf,*.doc,*.docx,*.ppt,*.pptx,*.xls,*.xlsx,*.epub,*.mobi
" set wildignore+=vendor/*,vendor/bundle/*,*vendor/cache/*,*/vendor/ruby/*,*/tmp/*,*/log/*,*/.chef/checksums/*,*/node_modules/*,public/assets*

" FZF
set rtp+=~/.env/bin/fzf

" Redefine :Ag command to fix colors
autocmd VimEnter * command! -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, '--color-path "1;33" --color-line-number "1;33"',
  \ fzf#vim#default_layout)

" Display number of results inline
if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

" Run Neomake on save
autocmd! BufWritePost * Neomake

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
