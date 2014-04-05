" Map leader key to ,
let mapleader = ","

" Look up a synonym online
nnoremap <Leader>t :OnlineThesaurusCurrentWord<CR>

" Make grep (ag) easier
noremap <Leader>f :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <Leader>ff :Ag<SPACE>

" Use CTRL-S for saving
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Use CTRL-Q for quitting
noremap <C-Q> :q<CR>

" Use CTRL-W for closing buffers 
noremap <Leader>W :bd<CR>

" Resize windows
nmap <Leader>k <C-W>-<C-W>-
nmap <Leader>j <C-W>+<C-W>+
nmap <Leader>h <C-W>><C-W>>
nmap <Leader>l <C-W><<C-W><

" Toggle NERDTree
map <Leader>d :NERDTreeToggle<CR>

" Open tag in new window
nnoremap <Leader>m <C-w><C-]><C-w>T

" Edit vimrc
map <Leader>rc :vsp $MYVIMRC<cr>

" Source vimrc
map <Leader>sc :source $MYVIMRC<cr>

" Show bufferlist
map <Leader>b :Bufferlist<cr>

" Completion
inoremap <Leader>n <C-x><C-o>

" Prompt for a command to run
map <Leader>rp :PromptVimTmuxCommand

" Run last command executed by RunVimTmuxCommand
map <Leader>rl :RunLastVimTmuxCommand

" Inspect runner pane
map <Leader>ri :InspectVimTmuxRunner

" Close all other tmux panes in current window
map <Leader>rx :call VimuxCloseRunner()<cr>

" Interrupt any command running in the runner pane
map <Leader>rs :InterruptVimTmuxRunner

" Compile LaTeX file
autocmd FileType tex map <Leader>c :!pdflatex %<cr>

" Compile and run Scala file
autocmd FileType scala map <Leader>c :!scalac % && scala -cp . %<cr>

" Run Ruby file
autocmd FileType ruby map <Leader>c :!clear; ruby %<cr>

" Compile and run Java file
autocmd FileType java map <Leader>c :!javac "%:p" && java -cp "%:p:h" "%:t:r"<CR>

" Run Rubocop in a tmux pane
map <Leader>bo :call VimuxRunCommand('rubocop ' . expand('%:p'))<CR>

" Remove highlighting easily
map <Leader><Space> :nohl<CR>

" Disable arrow keys for navigation things.
map <Left> :echo "Use h instead."<CR>
map <Right> :echo "Use l instead."<CR>
map <Up> :echo "Use k instead."<CR>
map <Down> :echo "Use j instead."<CR>

" Switch between paste and nopaste mode.
map <Leader>p :set paste<CR>
map <Leader>P :set nopaste<CR>
