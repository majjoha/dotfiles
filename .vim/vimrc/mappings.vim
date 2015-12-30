" Map leader key to ,
let mapleader = "\<Space>"

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

" Navigate screen lines instead of file lines
nmap k gk
nmap j gj

" Toggle NERDTree
map <Leader>d :NERDTreeToggle<CR>

" Edit vimrc
map <Leader>rc :vsp $MYVIMRC<cr>

" Source vimrc
map <Leader>sc :source $MYVIMRC<cr>

" Show bufferlist
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader>b :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" Show FZF
map <C-p> :FZF<CR>

" Run current spec in tmux pane
map <Leader>r :call VimuxRunCommand("clear; bundle exec rspec " . bufname("%"))<CR>
map <Leader>R :call VimuxRunCommand("clear; bundle exec rspec " . expand("%p") . ":" . line("."))<CR>
map <Leader>rx :call VimuxCloseRunner()<cr>

" Remove highlighting easily
map <Leader><Space> :nohl<CR>

" Switch between paste and nopaste mode.
map <Leader>p :set paste<CR>i
map <Leader>P :set nopaste<CR>

" Open work notes
map <Leader>on :vs ~/Code/zendesk/notes.md<CR>

" Open completion menu
inoremap <Leader>c <C-x><C-o>

" Open vertical split
map <Leader>v :vsp<CR>

" Make
map <Leader>m :make<CR>
