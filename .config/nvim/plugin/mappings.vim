" Map leader key to space
noremap <Leader> <Nop>
let mapleader = "\<Space>"

" Use Control-S for saving
inoremap <silent><C-s> <C-o>:update<CR>
nnoremap <silent><C-s> :update<CR>
nnoremap <silent><Leader>w :update<CR>

" Use Control-Q for quitting
nnoremap <silent><C-q> :q<CR>
tnoremap <silent><C-q> <C-\><C-n>:q<CR>

" Open the current buffer in a new tab
nnoremap <silent><Leader>mw :call majjoha#OpenCurrentAsNewTab()<CR>
nnoremap <silent><Leader>cw :tabc<CR>

" Keep the visual selection when indenting/outdenting
xnoremap > >gv
xnoremap < <gv

" Navigate screen lines instead of file lines
noremap k gk
noremap j gj

" Toggle NvimTree
nnoremap <silent><Leader>d :NvimTreeToggle<CR>
nnoremap <silent><Leader>D :NvimTreeFindFile<CR>

" Search the contents of the files in the current directory
nnoremap <silent><Leader>f :Rg<CR>

" Search buffers
nnoremap <silent><Leader>bb :Buffers<CR>

" Show files
nnoremap <silent><Leader>p :Files<CR>

" Search commands
nnoremap <silent><Leader>cc :Commands<CR>

" Search file types
nnoremap <silent><Leader>sf :Filetypes<CR>

" Search help files
nnoremap <silent><Leader>h :Help<CR>

" Remove search highlighting
nnoremap <silent><Leader><Leader> :let @/ = ""<CR>

" Open vertical split
nnoremap <Leader>v :vsp<CR>

" Open horizontal split
nnoremap <Leader>x :sp<CR>

" Git-related mappings
nnoremap <silent><Leader>bc :Commits<CR>
nnoremap <silent><Leader>gb :Git blame<CR>
nnoremap <Leader>gc :tab Git commit -v<CR>
nnoremap <Leader>gcb :Git checkout -b<Space>
nnoremap <silent><Leader>gco :call fzf#run(
\ fzf#wrap({
\   'source': 'git branch --sort=-committerdate \| sed "s/.* //"',
\   'sink': '!git checkout ',
\   'options': '+m --prompt="Branch >" --preview="git show --color=always {}"'
\ })
\ )<CR>
nnoremap <Leader>gd :Gdiffsplit!<CR>
nnoremap <Leader>gr :Git rebase -i origin/main<CR>
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gg :Git<Space>
nnoremap <Leader>gpr :!git pr<CR>
nnoremap <Leader>gpp :Git pull<CR>
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gl :tabe \| terminal tig<CR>

" Toggle comments
xmap <silent><Leader>/ :Comment<CR>
nmap <silent><Leader>/ :Comment<CR>

" Edit snippets for the current file type
noremap <silent><Leader>es :NeoSnippetEdit -split -vertical<CR>

" Open a terminal in a split window
nnoremap <Leader>tv :vsp \| term<CR>
nnoremap <Leader>ts :sp \| term<CR>

" Search in visual selection
xnoremap / <ESC>/\%V

" Alternate via vim-projectionist
nnoremap <silent><Tab> :A<CR>

" Move up and down in completion menus using j and k
inoremap <expr> j pumvisible() ? '<C-n>' : 'j'
inoremap <expr> k pumvisible() ? '<C-p>' : 'k'

" Test-related mappings
nnoremap <Leader>rt :TestFile<CR>
nnoremap <Leader>rl :TestNearest<CR>
nnoremap <Leader>rs :TestSuite<CR>

" Use ' instead of ` when navigating to the position of a mark
nnoremap ' `

" Allow the file under the cursor to be opened even if it does not exist
nnoremap <silent><Leader>gf :e <cfile><CR>

" Edit file
nnoremap <Leader>ee :e<Space>

" Sort visual selection
xnoremap <silent><Leader>ss :!sort<CR>

" Go to the beginning and end of the line in command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Replace instances of a word under the cursor (similar to multiple cursors)
nnoremap <C-n> *Ncgn

" Save and load sessions
nnoremap <silent><Leader>ms :mksession!<CR>
nnoremap <silent><Leader>ls :source Session.vim<CR>

" Use <Esc> to return to normal mode in terminals unless the terminal is
" running FZF
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

" Emacs-style navigation in insert mode
imap <C-e> <C-o>$
imap <C-a> <C-o>^

" Mappings for navigation the quickfix list
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

" Add mappings for Marginalia
nnoremap <Leader>mnn :MarginaliaNew<Space>
nnoremap <Leader>men :MarginaliaEdit<Space>
nnoremap <silent><Leader>mln :MarginaliaList<CR>
nnoremap <silent><Leader>mfb :MarginaliaFindBacklinks<CR>
nnoremap <Leader>mft :MarginaliaFindTagReferences<Space>
nnoremap <silent><Leader>mcw :MarginaliaConvertWordToTag<CR>

" ALE-related mappings
nnoremap <silent><Leader>ad :ALEDetail<CR>
nnoremap <silent><Leader>af :ALEFindReferences -relative<CR>
nnoremap <silent><Leader>ag :ALEGoToDefinition<CR>
nnoremap <silent><Leader>ah :ALEHover<CR>
nnoremap <silent><Leader>ar :ALERename<CR>
inoremap <silent><C-Space> <C-\><C-O>:ALEComplete<CR>
