" Skip if NvimTree is not loaded
if !exists("g:loaded_tree")
  finish
endif

" Append trailing slash to folder names
let g:nvim_tree_add_trailing = 1

" Don't display these kind of files
let g:nvim_tree_ignore = [
\ '.class$',
\ '.o$',
\ '\.git$',
\ '.DS_Store',
\ '.aux',
\ '.idr\~',
\ '.ibc',
\ '.prefab',
\ '.meta',
\ '.beam'
\ ]

" Change default icons
let g:nvim_tree_show_icons = {
\ "git": 0,
\ "folders": 1,
\ "files": 0,
\ "folder_arrows": 1,
\ }

let g:nvim_tree_icons = {
\ "default": "",
\ "symlink": "",
\ "git": {
\   "unstaged": "",
\   "staged": "",
\   "unmerged": "",
\   "renamed": "",
\   "untracked": "",
\   "deleted": "",
\   "ignored": ""
\   },
\ "folder": {
\   "arrow_open": "",
\   "arrow_closed": "",
\   "default": "",
\   "open": "",
\   "empty": "",
\   "empty_open": "",
\   "symlink": "",
\   "symlink_open": "",
\   },
\   "lsp": {
\     "hint": "",
\     "info": "",
\     "warning": "",
\     "error": "",
\   }
\ }
