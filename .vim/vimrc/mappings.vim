" Map leader key to space
nmap <space> <leader>
vmap <space> <leader>

let maplocalleader = ","

" Make grep (ag) easier
nnoremap <silent><Leader>f :Ag <C-R><C-W><CR>
nnoremap <Leader>ff :Ag<CR>

" Use CTRL-S for saving
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>
noremap <Leader>s :update<CR>

" Use CTRL-Q for quitting
noremap <C-Q> :q<CR>
noremap <Leader>q :q<CR>
tnoremap <C-Q> <C-\><C-n>:q<CR>

" Resize windows
nmap <Leader>k <C-W>-<C-W>-
nmap <Leader>j <C-W>+<C-W>+
nmap <Leader>h <C-W>><C-W>>
nmap <Leader>l <C-W><<C-W><

" Maximize current window
nmap <Leader>wf <C-W>o

" Navigate screen lines instead of file lines
nmap k gk
nmap j gj

" Toggle NERDTree
map <Leader>d :NERDTreeToggle<CR>
map <Leader>D :NERDTreeFocus<CR>
map <Leader>wd :NERDTreeFind<CR>

" Edit vimrc
map <Leader>rc :vsp $MYVIMRC<cr>

" Source vimrc
map <Leader>sc :source $MYVIMRC<cr>

" Search through buffers
nnoremap <silent> <Leader>bb :Buffers<cr>

" Show FZF
map <Leader>p :FZF<CR>

" Search through commands
nmap <Leader>c :Commands<CR>

" Search through file types
nmap <Leader>sf :Filetypes<CR>

" Run current spec in terminal window
function! NeotermClearClose()
  call neoterm#clear()
  call neoterm#close()
endfunction
nmap <Leader>rt :call neoterm#test#run('file')<cr>
nmap <Leader>rl :call neoterm#test#run('current')<cr>
nmap <Leader>rx :call NeotermClearClose()<cr>

" Remove highlighting easily
map <Leader><Space> :let @/ = ""<CR>

" Open work notes
map <Leader>on :vs ~/vimwiki/Todo.wiki<CR>

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
au FileType gitcommit nnoremap <buffer><silent> cs :<C-U>Git stash<CR>

" Set mappings for sending content to REPL
nnoremap <silent> <Leader>tt :TREPLSend<cr>
vnoremap <silent> <Leader>tt :TREPLSend<cr>

" Toggle comments
nnoremap <Leader>/ :Commentary<cr>
vnoremap <Leader>/ :Commentary<cr>

" Open alternate file via vim-projectionist
nmap <Leader>a :A<cr>

" Define path expansion for various file types
au BufEnter *.rb nmap <Leader>et :execute 'Etest '.expand("%:r")<cr>
au BufEnter *.js nmap <Leader>et :execute 'Etest '.expand("%:p:h")<cr>

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
    let g:lightline.colorscheme = 'PaperColor_light'
  endif

  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction
map <Leader>bg :call ToggleBackground()<cr>
