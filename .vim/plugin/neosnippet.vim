" Disable default snippets
let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }

" Enable compatibility with snipmate
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory = []
let g:neosnippet#snippets_directory += ['~/.env/.vim/pack/packages/start/vim-snippets/snippets']
let g:neosnippet#snippets_directory += ['~/.env/.vim/snippets']

" Mimic SuperTab snippets behavior
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
