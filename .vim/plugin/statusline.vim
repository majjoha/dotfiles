" Flush status line
set statusline=

" Show the current Git branch
set statusline+=%{majjoha#ShowGitBranch()}\ 

" Show the name of the current file
set statusline+=%<%f\ 

" Show modified flag
set statusline+=%-4m

" Show readonly flag
set statusline+=%r

" Align right
set statusline+=%=

" Show the file type if any file type is set
set statusline+=%{strlen(&filetype)>0?&filetype.'\ \|\ ':''}

" Show the percentage through the file
set statusline+=%4.(%p%%%)\ 

" Show line and column numbers
set statusline+=\|\ %6.(%l\:%c%)\ 
