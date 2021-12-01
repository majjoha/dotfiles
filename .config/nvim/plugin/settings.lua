-- Set the terminal title
vim.opt.title = true

-- Use spaces instead of tabs
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Share the unnamed paste buffer with the system clipboard
vim.opt.clipboard = "unnamed"

-- Disable swapfiles
vim.opt.swapfile = false

-- Open split windows below and to the right of the current window
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Show the popup menu even if there is only one match and insert only the
-- longest common text of the matches
vim.opt.completeopt = { "longest", "menuone" }

-- Allow the mouse in all modes
vim.opt.mouse = "a"

-- Allow per project `.vimrc`
vim.opt.exrc = true

-- Disable shell execution and write options
vim.opt.secure = true

-- Round indent to multiple of `shiftwidth`
vim.opt.shiftround = true

-- Ignore case sensitivity, so `foo` matches foo, Foo, and FOO
vim.opt.ignorecase = true

-- But Foo should only match Foo
vim.opt.smartcase = true

-- Adjust case sensitivity of match depending on the typed text
vim.opt.infercase = true

-- Ignore case sensitivity for files in `:cd`
vim.opt.fileignorecase = true

-- Assume fast terminal
vim.opt.ttyfast = true
vim.opt.lazyredraw = true

-- Disable the intro message
vim.opt.shortmess = vim.o.shortmess .. "I"

-- Delete the comment character when joining commented lines
vim.opt.formatoptions = vim.o.formatoptions .. "j"

-- Show spell suggestions in a smaller window
vim.opt.spellsuggest = "15"

-- Look for tags in `.git/tags`
vim.opt.tags = vim.o.tags .. ",.git/tags"

-- Allow the cursor to move where there is no text in visual select mode
vim.opt.virtualedit = "block"

-- Store undo history
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.config/nvim/undo")

-- Use `rg` for searching
vim.opt.grepprg = "rg --vimgrep --hidden -i"
vim.opt.grepformat = "%f:%l:%c:%m"

-- Enable dialog menus for confirmations
vim.opt.confirm = true

-- Do not jump to the start of the line when navigating files
vim.opt.startofline = false
