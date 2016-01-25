" Map leader key to space
nmap <space> <leader>
vmap <space> <leader>

" Make grep (ag) easier
nnoremap <silent><Leader>f :Ag <C-R><C-W><CR>
nnoremap <Leader>ff :Ag<CR>

" Use CTRL-S for saving
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Use CTRL-Q for quitting
noremap <C-Q> :q<CR>
noremap <Leader>q :q<CR>

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

" Search through buffers
nnoremap <silent> <Leader>bb :Buffers<cr>

" Show FZF
map <Leader>p :FZF<CR>

" Run current spec in terminal window
nmap <Leader>r :call neoterm#test#run('file')<cr>
nmap <Leader>rx :call neoterm#close()<cr>

" Run Flow in terminal
nmap <Leader>rf :T clear && flow check<CR>

" Remove highlighting easily
map <Leader><Space> :nohl<CR>

" Open work notes
map <Leader>on :vs ~/Code/zendesk/notes.md<CR>

" Open vertical split
map <Leader>v :vsp<CR>

" Mappings for Git
nmap <Leader>bc :Commits<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gcb :Git checkout -b<space>
nmap <Leader>gd :Gvdiff<CR>
nmap <Leader>gr :Git rebase -i origin/master<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gg :Git<space>

" Set mappings for sending content to REPL
nnoremap <silent> <Leader>tt :TREPLSend<cr>
vnoremap <silent> <Leader>tt :TREPLSend<cr>

" Toggle comments
nnoremap <Leader>/ :Commentary<cr>
vnoremap <Leader>/ :Commentary<cr>

" Sort values
vnoremap <Leader>ss d:execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>

" Open alternate file via vim-projectionist
nmap <Leader>a :A<cr>
nmap <Leader>er :Erecord<space>
nmap <Leader>es :Eschema<space>

" Define path expansion for various file types
au BufEnter *.rb nmap <Leader>et :execute 'Etest '.expand("%:r")<cr>
au BufEnter *.js nmap <Leader>et :execute 'Etest '.expand("%:p:h")<cr>
