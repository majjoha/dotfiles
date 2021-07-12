-- Flush status line
vim.opt.statusline = ""

-- Show the current Git branch
vim.opt.statusline = vim.o.statusline .. "%{majjoha#ShowGitBranch()} "

-- Show the name of the current file
vim.opt.statusline = vim.o.statusline .. "%<%f "

-- Show modified flag
vim.opt.statusline = vim.o.statusline .. "%-4m"

-- Show readonly flag
vim.opt.statusline = vim.o.statusline .. "%r"

-- Align right
vim.opt.statusline = vim.o.statusline .. "%="

-- Show the file type if any file type is set
vim.opt.statusline = vim.o.statusline ..
                       "%{strlen(&filetype)>0?&filetype.' | ':''}"

-- Show the percentage through the file
vim.opt.statusline = vim.o.statusline .. "%4.(%p%%%) "

-- Show line and column numbers
vim.opt.statusline = vim.o.statusline .. "| %6.(%l:%c%) "
