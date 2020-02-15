" Redefine representation of warnings and errors
let g:ale_sign_error = '▍'
let g:ale_sign_warning = '▍'
highlight ALEError cterm=underline ctermfg=01
highlight ALEWarning cterm=underline ctermfg=01
highlight link ALEErrorSign DiffDelete
highlight link ALEWarningSign DiffDelete
highlight link ALEVirtualTextError DiffDelete
highlight link ALEVirtualWarning DiffDelete

let g:ale_lint_on_text_changed = 'normal' 

let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = "▍"

" Use ALE for completion
set omnifunc=ale#completion#OmniFunc
