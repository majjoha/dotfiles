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

" Set statusline
set laststatus=2

let g:lightline = {
  \ 'colorscheme': '16color',
  \ }

" Ignore binary files
set wildignore+=tags,*.DS_Store,*.o,*.obj,.git,*.class,*.png,*.jpg,*.jpeg,*.gif,*.ico,*.pdf,*.doc,*.docx,*.ppt,*.pptx,*.xls,*.xlsx,*.epub,*.mobi
set wildignore+=vendor/*,vendor/bundle/*,*vendor/cache/*,*/vendor/ruby/*,*/tmp/*,*/log/*,*/.chef/checksums/*,*/node_modules/*,public/assets*

" FZF
set rtp+=~/.env/bin/fzf

" Run Neomake on save
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['standard', 'flow']

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

" Hide noise from NERDTree
let NERDTreeMinimalUI = 1
