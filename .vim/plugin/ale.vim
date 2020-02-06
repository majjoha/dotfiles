" Redefine representation of warnings and errors
let g:ale_sign_error = '▌'
let g:ale_sign_warning = '▌'
highlight link ALEErrorSign DiffDelete
highlight link ALEWarningSign DiffDelete

let g:ale_lint_on_text_changed = 'normal' 

" Use ALE for completion
set omnifunc=ale#completion#OmniFunc
