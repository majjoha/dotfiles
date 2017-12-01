let g:OmniSharp_selector_ui = 'fzf'
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal completeopt-=preview
setlocal noshowmatch
setlocal omnifunc=OmniSharp#Complete
setlocal updatetime=200

" Mappings
nmap K :OmniSharpDocumentation<cr>
nmap <Leader>F :OmniSharpCodeFormat<cr>
nmap <Leader>U :OmniSharpFindUsages<cr>
nmap <Leader>R :OmniSharpRename<cr>
