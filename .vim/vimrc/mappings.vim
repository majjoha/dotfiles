" Map leader key to space
nmap <space> <leader>
vmap <space> <leader>

" Make grep (ripgrep) easier
nnoremap <silent><Leader>f :Rg <C-R><C-W><CR>
nnoremap <Leader>ff :Rg<CR>

" Use Control-S for saving
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Use Control-Q for quitting
noremap <C-Q> :q<CR>
tnoremap <C-Q> <C-\><C-n>:q<CR>

" Maximize current window
function! OpenCurrentAsNewTab()
  let l:currentPos = getcurpos()
  tabedit %
  call setpos(".", l:currentPos)
endfunction
nmap <Leader>mw :call OpenCurrentAsNewTab()<CR>
nmap <Leader>cw :tabc<CR>

" Keep selection when indenting/outdenting
vnoremap > >gv
vnoremap < <gv

" Move lines vertically
xnoremap J :move '<-2<CR>gv=gv
xnoremap K :move '>+1<CR>gv=gv

" Navigate screen lines instead of file lines
nmap k gk
nmap j gj

" Toggle NERDTree
map <Leader>d :NERDTreeToggle<CR>
map <Leader>D :NERDTreeFind<CR>

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
nmap <Leader>gc :Gcommit -v<CR>
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
nmap <Leader>es :NeoSnippetEdit -split -vertical<cr>

" Split window with terminal
nmap <Leader>tv :vsp<cr>:term<cr>
nmap <Leader>ts :sp<cr>:term<cr>

" Enable completion menu
inoremap <C-Space> <c-x><c-o>

" Search only in visual selection
vnoremap / <ESC>/\%V

" Alternate via vim-projectionist
nmap <Leader>a :A<CR>

" Control options in menus with j and k
inoremap <expr> j pumvisible() ? '<C-n>' : 'j'
inoremap <expr> k pumvisible() ? '<C-p>' : 'k'

" Mappings for testing
nmap <Leader>rt :TestFile<cr>
nmap <Leader>rl :TestNearest<cr>

" Use ' instead of ` when navigating to the position of a mark
nnoremap ' `

" Allow the file under the cursor to be opened even if it does not exist
map <leader>gf :e <cfile><cr>

" Sort visual selection
vnoremap <Leader>ss :!sort<CR>

" Flip text segments
nmap <Leader>sw :Switch<CR>

nmap <Leader>rgc :Rails g controller<space>
nmap <Leader>rgm :Rails g model<space>
nmap <Leader>rec :Econtroller<cr>
nmap <Leader>rem :Emodel<cr>
nmap <Leader>res :Espec<cr>
nmap <Leader>rr :Rails<space>
nmap <Leader>rdm :Rails db:migrate<cr>
