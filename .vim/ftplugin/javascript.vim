let b:ale_fixers = ['eslint']
let b:ale_linters_ignore = ['tsserver']
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:flow#enable = 0

" Do not add `//` on a new line when hitting `o` on a commented line
setlocal formatoptions-=o
