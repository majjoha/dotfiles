" Use spell checker
setlocal spell spelllang=en_us

" Use thesaurus
setlocal thesaurus+=~/.config/nvim/thesaurus/thesaurus.txt

" Set text width to 80
setlocal textwidth=80

" Enable completion
setlocal complete+=kspell

" Enable Dictionary.app lookups
setlocal keywordprg=:silent\ !open\ dict:///\
