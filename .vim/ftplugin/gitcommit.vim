" Use spell checker
setlocal spell spelllang=en_us

" Set text width to 80
setlocal textwidth=80

" Enable completion
setlocal complete+=kspell

" Enable Dictionary.app lookups
nmap K :silent !open dict:///<cword><cr>
