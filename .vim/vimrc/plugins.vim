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

" Ignore binary files
set wildignore+=tags,*.DS_Store,*.o,*.obj,.git,*.class,*.png,*.jpg,*.jpeg,*.gif,*.ico,*.pdf,*.doc,*.docx,*.ppt,*.pptx,*.xls,*.xlsx,*.epub,*.mobi
set wildignore+=vendor/*,vendor/bundle/*,*vendor/cache/*,*/vendor/ruby/*,*/tmp/*,*/log/*,*/.chef/checksums/*,*/.git/*,*/node_modules/*,public/assets*

" FZF
set rtp+=~/.env/bin/fzf
