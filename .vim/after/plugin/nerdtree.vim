" Show hidden files in NERDTree
let NERDTreeShowHidden = 1
let NERDTreeShowFiles = 1

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline = 1

" Toggle directory nodes and open non-directory nodes with mouse clicks
let g:NERDTreeMouseMode=3

" Don't display these kind of files
let NERDTreeIgnore = [
\ '\.class$',
\ '\.o$',
\ '^\.git$',
\ '\.DS_Store',
\ '\.aux',
\ '.idr\~',
\ '.ibc',
\ '.prefab',
\ '.meta'
\]

" Hide noise from NERDTree
let NERDTreeMinimalUI = 1

" Change default arrows
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
