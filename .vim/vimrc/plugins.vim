" Source Snipmate to make it work (oddly).
source ~/.env/.vim/bundle/vim-snipmate/after/plugin/snipMate.vim

" Enable online thesaurus
let g:online_thesaurus_map_keys = 0

" Work with LaTeX in Vim
let g:LatexBox_latexmk_options = "-pvc -pdfps"
let g:Tex_CompileRule_pdf = 'latexmk -pdf -pvc $*'

" Show hidden files in NERDTree
let NERDTreeShowHidden=1
let NERDTreeShowFiles=1

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

" Don't display these kind of files
let NERDTreeIgnore=['\.class$','\.o$','^\.git$','\.DS_Store','\.aux']

" Powerline fonts for Airline
let g:airline_powerline_fonts = 1

" Set Airline theme
let g:airline_theme = 'tomorrow'
let g:airline_powerline_fonts=1

" Use Airline on default
set laststatus=2

" Show ctrlp at the top of the window instead of the bottom
let g:ctrlp_match_window_bottom = 0

" Show more files
let g:ctrlp_max_height = 20

" Save cache.
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0

" Show hidden files
let g:ctrlp_show_hidden = 1

" Ignore binary files
set wildignore+=tags,*.DS_Store,*.o,*.obj,.git,*.class,*.png,*.jpg,*.jpeg,*.gif,*.ico,*.pdf,*.doc,*.docx,*.ppt,*.pptx,*.xls,*.xlsx,*.epub,*.mobi
set wildignore+=*/vendor/**,*vendor/cache/*,*/vendor/ruby/*,*/tmp/*,*/log/*,*/.chef/checksums/*,*/.git/*,*/node_modules/*,public/assets*

" Set gist-vim to copy to pbcopy
let g:gist_clip_command = 'pbcopy'

" Use spring for rspec
"let g:vroom_use_spring = 1

" Use vimux and zeus for ovroom
let g:vroom_use_vimux = 1

" Use tmux for slime
let g:slime_target = "tmux"
