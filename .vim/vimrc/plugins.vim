" Source Snipmate to make it work (oddly).
source ~/.env/.vim/bundle/vim-snipmate/after/plugin/snipMate.vim

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

" Show more files
let g:ctrlp_max_height = 20

" Save cache.
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0

" Show hidden files
let g:ctrlp_show_hidden = 1

" Use current directory
let g:ctrlp_working_path_mode = 0

" PyMatcher for CtrlP
if !has('python')
  echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

" Ignore binary files
set wildignore+=tags,*.DS_Store,*.o,*.obj,.git,*.class,*.png,*.jpg,*.jpeg,*.gif,*.ico,*.pdf,*.doc,*.docx,*.ppt,*.pptx,*.xls,*.xlsx,*.epub,*.mobi
set wildignore+=vendor/*,vendor/bundle/*,*vendor/cache/*,*/vendor/ruby/*,*/tmp/*,*/log/*,*/.chef/checksums/*,*/.git/*,*/node_modules/*,public/assets*
