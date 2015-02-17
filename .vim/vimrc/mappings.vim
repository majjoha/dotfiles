" Map leader key to ,
let mapleader = ","

" Make grep (ag) easier
noremap <Leader>f :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <Leader>ff :Ag<SPACE>

" Use CTRL-S for saving
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Use CTRL-Q for quitting
noremap <C-Q> :q<CR>

" Resize windows
nmap <Leader>k <C-W>-<C-W>-
nmap <Leader>j <C-W>+<C-W>+
nmap <Leader>h <C-W>><C-W>>
nmap <Leader>l <C-W><<C-W><

" Toggle NERDTree
map <Leader>d :NERDTreeToggle<CR>

" Edit vimrc
map <Leader>rc :vsp $MYVIMRC<cr>

" Source vimrc
map <Leader>sc :source $MYVIMRC<cr>

" Show bufferlist
map <Leader>b :CtrlPBuffer<cr>

" Run current spec in tmux pane
map <Leader>r :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>
map <Leader>R :call VimuxRunCommand("clear; rspec " . expand("%p") . ":" . line("."))<CR>
map <Leader>rx :call VimuxCloseRunner()<cr>

" Remove highlighting easily
map <Leader><Space> :nohl<CR>

" Disable spelling
map <Leader>ds :setlocal nospell<CR>

" Switch between paste and nopaste mode.
map <Leader>p :set paste<CR>i
map <Leader>P :set nopaste<CR>

" Send selection to tmux pane
map <Leader>ssc :ConnectToTmux
vmap <Leader>s :SendSelectionToTmux<CR>

" Open work notes
map <Leader>on :vs ~/Code/zendesk/notes.md<CR>

" Insert current date
map <Leader>cd  "=strftime("%Y-%m-%d")<CR>P

inoremap <Leader>c <C-x><C-o>
