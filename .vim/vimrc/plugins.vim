" Set UltiSnipsSnippetDirectories to an empty array in order to use snippets
" for snipMate instead of UltiSnips by default.
let g:UltiSnipsSnippetDirectories=[]

let g:UltiSnipsExpandTrigger="<tab>"

" Mimic behavior from snipMate.
let g:UltiSnipsJumpForwardTrigger="<tab>"

" Set path for private snippets
let g:UltiSnipsSnippetsDir="~/.env/.vim/snippets"

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
  \ 'colorscheme': 'seoul256',
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
  \ 'subseparator': { 'left': '|', 'right': '' }
  \ }

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

" Ignore binary files
set wildignore+=tags,*.DS_Store,*.o,*.obj,.git,*.class,*.png,*.jpg,*.jpeg,*.gif,*.ico,*.pdf,*.doc,*.docx,*.ppt,*.pptx,*.xls,*.xlsx,*.epub,*.mobi
set wildignore+=vendor/*,vendor/bundle/*,*vendor/cache/*,*/vendor/ruby/*,*/tmp/*,*/log/*,*/.chef/checksums/*,*/node_modules/*,public/assets*

" FZF
set rtp+=~/.env/bin/fzf

" Run Neomake on save
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['standard', 'flow']

let g:neomake_warning_sign = {
  \ 'text': '~',
  \ }

let g:neomake_error_sign = {
  \ 'text': '×',
  \ }

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

" Auto-clean Fugitive buffers. Taken from:
" http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
autocmd BufReadPost fugitive://* set bufhidden=delete

" Set up tests for RSpec in Docker
function! neoterm#test#rspec#run(scope)
  let command = 'zdi knowledge_api -d run bundle exec rspec'

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
