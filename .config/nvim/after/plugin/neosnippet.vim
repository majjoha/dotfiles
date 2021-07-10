" Skip if Neosnippet is not loaded
if !exists("g:loaded_neosnippet")
  finish
endif

" Disable default snippets
let g:neosnippet#disable_runtime_snippets = {
\ '_' : 1,
\}

" Enable compatibility with snipMate
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory = [
\ '~/.config/nvim/pack/packages/start/vim-snippets/snippets',
\ '~/.config/nvim/snippets'
\]
