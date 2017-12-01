" Map leader key to space
nmap <space> <leader>
vmap <space> <leader>

" Set local leader to comma
let maplocalleader = ","

" Make grep (ag) easier
nnoremap <silent><Leader>f :Ag <C-R><C-W><CR>
nnoremap <Leader>ff :Ag<CR>

" Use Control-S for saving
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Use Control-Q for quitting
noremap <C-Q> :q<CR>
tnoremap <C-Q> <C-\><C-n>:q<CR>

" Maximize current window
nmap <Leader>mw <C-W>o

" Keep selection when indenting/outdenting
vnoremap > >gv
vnoremap < <gv

" Navigate screen lines instead of file lines
nmap k gk
nmap j gj

" Toggle NERDTree
map <Leader>d :NERDTreeToggle<CR>
map <Leader>D :NERDTreeFocus<CR>
map <Leader>fd :NERDTreeFind<CR>

" Edit vimrc
map <Leader>rc :vsp $MYVIMRC<cr>

" Source vimrc
map <Leader>sc :source $MYVIMRC<cr>

" Search through buffers
nnoremap <silent> <Leader>bb :Buffers<cr>

" Show FZF
map <Leader>p :Files<CR>

" Search through commands
map <Leader>c :Commands<CR>

" Search through file types
nmap <Leader>sf :Filetypes<CR>

" Remove highlighting
map <Leader><Space> :let @/ = ""<CR>

" Open vertical split
map <Leader>v :vsp<CR>

" Mappings for Git
nmap <Leader>bc :Commits<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gcb :Git checkout -b<space>
nmap <Leader>gco :call fzf#run({
  \  'source': 'git branch \| sed "s/.* //"',
  \  'sink': ':!git checkout ',
  \  'options': '+m --prompt="Branch> "',
  \  'down': '~40%'
  \})<CR><cr>
nmap <Leader>gd :Gvdiff<CR>
nmap <Leader>gr :Git rebase -i origin/master<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gg :Git<space>
nmap <Leader>gpr :!git pr<cr>
nmap <Leader>gpp :Git pull<cr>
nmap <Leader>gl :vs<CR>:terminal tig<CR>

" Toggle comments
nnoremap <Leader>/ :Commentary<cr>
vnoremap <Leader>/ :Commentary<cr>

" Easily open snippets
nmap <Leader>os :NeoSnippetEdit -split -vertical<cr>

" Split window with terminal
nmap <Leader>tv :vsp<cr>:term<cr>
nmap <Leader>ts :sp<cr>:term<cr>

" Switching background quickly
function! ToggleBackground()
  let &background = (&background == "dark"? "light" : "dark")
  if (&background == "dark")
    let g:lightline.colorscheme = '16color'
  else
    let g:lightline.colorscheme = 'Tomorrow'
  endif

  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction
map <Leader>bg :call ToggleBackground()<cr>

" Enable completion menu
inoremap <C-Space> <c-x><c-o>

" Search only in visual selection
vnoremap / <ESC>/\%V

" Alternate via vim-projectionist
nmap <Leader>a :A<CR>
