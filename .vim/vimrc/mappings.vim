" Map leader key to space
let mapleader = "\<Space>"

" Use Control-S for saving
inoremap <C-s> <C-o>:update<CR>
nnoremap <C-s> :update<CR>

" Use Control-Q for quitting
nnoremap <C-q> :q<CR>
tnoremap <C-q> <C-\><C-n>:q<CR>

" Open the current buffer in a new tab
nnoremap <silent><Leader>mw :call majjoha#OpenCurrentAsNewTab()<CR>
nnoremap <Leader>cw :tabc<CR>

" Keep the visual selection when indenting/outdenting
xnoremap > >gv
xnoremap < <gv

" Move lines vertically
xnoremap J :move '<-2<CR>gv=gv
xnoremap K :move '>+1<CR>gv=gv

" Navigate screen lines instead of file lines
noremap k gk
noremap j gj

" Toggle NERDTree
nnoremap <silent><Leader>d :NERDTreeToggle<CR>
nnoremap <silent><Leader>D :NERDTreeFind<CR>

" Edit `$MYVIMRC`
nnoremap <Leader>rc :vsp $MYVIMRC<CR>

" Source `$MYVIMRC`
nnoremap <Leader>sc :source $MYVIMRC<CR>

" Search the contents of the files in the current directory
nnoremap <silent><Space>f :call majjoha#FZFOpen(":Rg")<CR>

" Search buffers
nnoremap <silent><Space>bb :call majjoha#FZFOpen(":Buffers")<CR>

" Show files
nnoremap <silent><Space>p :call majjoha#FZFOpen(":Files")<CR>

" Search commands
nnoremap <silent><Space>c :call majjoha#FZFOpen(":Commands")<CR>

" Search file types
nnoremap <silent><Space>sf :call majjoha#FZFOpen(":Filetypes")<CR>

" Search help files
nnoremap <silent><Space>h :call majjoha#FZFOpen(":Help")<CR>

" Remove search highlighting
nnoremap <silent><Leader><Space> :let @/ = ""<CR>

" Open vertical split
nnoremap <Leader>v :vsp<CR>

" Git-related mappings
nnoremap <silent><Space>bc :call majjoha#FZFOpen(":Commits")<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gc :Gcommit -v<CR>
nnoremap <Leader>gcb :Git checkout -b<Space>
nnoremap <silent><Leader>gco :call fzf#run({
\  'source': 'git branch \| sed "s/.* //"',
\  'sink': ':!git checkout ',
\  'options': '+m --prompt="Branch> "',
\  'down': '~40%'
\})<CR>
nnoremap <Leader>gd :Gvdiff<CR>
nnoremap <Leader>gr :Git rebase -i origin/master<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gg :Git<Space>
nnoremap <Leader>gpr :!git pr<CR>
nnoremap <Leader>gpp :Git pull<CR>
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gl :vs<CR>:terminal tig<CR>

" Toggle comments
xmap <Leader>/ <Plug>Commentary
nmap <Leader>/ <Plug>CommentaryLine

" Edit snippets for the current file type
noremap <silent><Leader>es :NeoSnippetEdit -split -vertical<CR>

" Open a terminal in a split window
noremap <Leader>tv :vsp<CR>:term<CR>
noremap <Leader>ts :sp<CR>:term<CR>

" Open completion menu
inoremap <C-Space> <c-x><c-o>

" Search in visual selection
xnoremap / <ESC>/\%V

" Alternate via vim-projectionist
nnoremap <Leader>a :A<CR>

" Move up and down in completion menus using j and k
inoremap <expr> j pumvisible() ? '<C-n>' : 'j'
inoremap <expr> k pumvisible() ? '<C-p>' : 'k'

" Test-related mappings
nnoremap <Leader>rt :TestFile<CR>
nnoremap <Leader>rl :TestNearest<CR>

" Use ' instead of ` when navigating to the position of a mark
nnoremap ' `

" Allow the file under the cursor to be opened even if it does not exist
nnoremap <Leader>gf :e <cfile><CR>

" Edit file
nnoremap <Leader>ee :e<Space>

" Sort visual selection
xnoremap <Leader>ss :!sort<CR>

" Flip text segments
nnoremap <Leader>sw :Switch<CR>

" Rails-related mappings
nnoremap <Leader>rgc :Rails g controller<Space>
nnoremap <Leader>rgm :Rails g model<Space>
nnoremap <Leader>rec :Econtroller<CR>
nnoremap <Leader>rem :Emodel<CR>
nnoremap <Leader>res :Espec<CR>
nnoremap <Leader>rr :Rails<Space>
nnoremap <Leader>rdm :Rails db:migrate<CR>

" Go to the beginning and end of the line in command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
