" Skip if ALE is not loaded
if !exists("g:loaded_ale")
  finish
endif

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
let g:ale_lint_on_insert_leave = 0
let g:ale_set_balloons = 1
let g:ale_fix_on_save = 1

" Use ALE for completion
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc

let g:ale_fixers = {
\ '*': ['remove_trailing_lines'],
\ 'css': ['prettier'],
\ 'javascript': ['eslint', 'prettier'],
\ 'json': ['jq'],
\ 'ruby': ['rubocop'],
\ 'typescript': ['eslint', 'prettier'],
\ 'typescriptreact': ['eslint', 'prettier']
\}

let g:ale_linters = {
\ 'ruby': ['solargraph', 'brakeman']
\}

let g:ale_linters_ignore = {
\ 'javascript': ['tsserver']
\}
