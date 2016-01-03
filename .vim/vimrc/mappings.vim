" Map leader key to ,
nmap <space> <leader>

" Easily escape from :term
tnoremap <Esc> <C-\><C-n>

" Make grep (ag) easier
nnoremap <Leader>f :Ag <cword><CR>
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
map <Leader>p :FZF<CR>

" Run current spec in terminal window
nmap <Leader>r :call neoterm#test#run('file')<cr>
nmap <Leader>rx :call neoterm#close()<cr>

" Remove highlighting easily
map <Leader><Space> :nohl<CR>

" Open work notes
map <Leader>on :vs ~/Code/zendesk/notes.md<CR>

" Open completion menu
inoremap <Leader>c <C-x><C-o>

" Open vertical split
map <Leader>v :vsp<CR>

" Make
map <Leader>m :make<CR>

" Mappings for Git
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gb :Gblame<CR>
