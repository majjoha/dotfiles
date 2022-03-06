local nvim_set_keymap = vim.api.nvim_set_keymap

-- Map leader key to space
nvim_set_keymap("n", "<Leader>", "<Nop>", { noremap = false, silent = false })
vim.g.mapleader = " "

-- Use Control-S for saving
nvim_set_keymap("i", "<C-s>", "<C-o>:update<CR>",
                { noremap = true, silent = true })
nvim_set_keymap("n", "<C-s>", ":update<CR>", { noremap = true, silent = true })

-- Use Control-Q for quitting
nvim_set_keymap("n", "<C-q>", ":q<CR>", { noremap = true, silent = true })
nvim_set_keymap("t", "<C-q>", "<C-\\><C-n>:q<CR>",
                { noremap = true, silent = true })

-- Open the current buffer in a new tab
nvim_set_keymap("n", "<Leader>mw",
                ":lua require('majjoha').open_current_as_new_tab()<CR>",
                { noremap = true, silent = true })

-- Close the current tab
nvim_set_keymap("n", "<Leader>cw", ":tabc<CR>",
                { noremap = true, silent = true })

-- Keep the visual selection when indenting/outdenting
nvim_set_keymap("x", ">", ">gv", { noremap = true })
nvim_set_keymap("x", "<", "<gv", { noremap = true })

-- Navigate screen lines instead of file lines
nvim_set_keymap("", "k", "gk", { noremap = true })
nvim_set_keymap("", "j", "gj", { noremap = true })

-- Toggle NvimTree
nvim_set_keymap("n", "<Leader>d", ":NvimTreeToggle<CR>",
                { noremap = true, silent = true })
nvim_set_keymap("n", "<Leader>D", ":NvimTreeFindFile<CR>",
                { noremap = true, silent = true })

-- Search the contents of the files in the current directory
nvim_set_keymap("n", "<Leader>f", ":Rg<CR>", { noremap = true, silent = true })

-- Search buffers
nvim_set_keymap("n", "<Leader>bb", ":Buffers<CR>",
                { noremap = true, silent = true })

-- Search files
nvim_set_keymap("n", "<Leader>p", ":Files<CR>",
                { noremap = true, silent = true })

-- Search commands
nvim_set_keymap("n", "<Leader>cc", ":Commands<CR>",
                { noremap = true, silent = true })

-- Search file types
nvim_set_keymap("n", "<Leader>sf", ":Filetypes<CR>",
                { noremap = true, silent = true })

-- Search help files
nvim_set_keymap("n", "<Leader>h", ":Help<CR>", { noremap = true, silent = true })

-- Remove search highlighting
nvim_set_keymap("n", "<Leader><Leader>", ":let @/ = ''<CR>",
                { noremap = true, silent = true })

-- Open vertical split
nvim_set_keymap("n", "<Leader>v", ":vsp<CR>", { noremap = true, silent = true })

-- Open horizontal split
nvim_set_keymap("n", "<Leader>x", ":sp<CR>", { noremap = true, silent = true })

-- Git-related mappings
nvim_set_keymap("n", "<Leader>bc", ":Commits<CR>",
                { noremap = true, silent = true })
nvim_set_keymap("n", "<Leader>gb", ":Git blame<CR>",
                { noremap = true, silent = true })
nvim_set_keymap("n", "<Leader>gc", ":tab Git commit -v<CR>", { noremap = true })
nvim_set_keymap("n", "<Leader>gcb", ":Git checkout -b<Space>",
                { noremap = true })
nvim_set_keymap("n", "<Leader>gco", ":call v:lua.fzf_search_branches()<CR>",
                { noremap = true, silent = true })
nvim_set_keymap("n", "<Leader>gd", ":Gdiffsplit!<CR>",
                { noremap = true, silent = true })
nvim_set_keymap("n", "<Leader>gr", ":Git rebase -i origin/main<CR>",
                { noremap = true, silent = true })
nvim_set_keymap("n", "<Leader>gs", ":Git<CR>", { noremap = true, silent = true })
nvim_set_keymap("n", "<Leader>gg", ":Git<Space>", { noremap = true })
nvim_set_keymap("n", "<Leader>gpr", ":!git pr<CR>",
                { noremap = true, silent = true })
nvim_set_keymap("n", "<Leader>gpp", ":Git pull<CR>",
                { noremap = true, silent = true })
nvim_set_keymap("n", "<Leader>ga", ":Gwrite<CR>",
                { noremap = true, silent = true })
nvim_set_keymap("n", "<Leader>gl", ":tabe | terminal tig<CR>",
                { noremap = true, silent = true })

-- Edit snippets for the current file type
nvim_set_keymap("n", "<Leader>es", ":SnippyEdit<Space>", { noremap = true })

-- Open a terminal in a split window
nvim_set_keymap("n", "<Leader>tv", ":vsp | term<CR>",
                { noremap = true, silent = true })
nvim_set_keymap("n", "<Leader>ts", ":sp | term<CR>",
                { noremap = true, silent = true })

-- Search in visual selection
nvim_set_keymap("x", "/", "<ESC>/\\%V", { noremap = true })

-- Alternate via vim-projectionist
nvim_set_keymap("n", "<Tab>", ":A<CR>", { noremap = true, silent = true })

-- Test-related mappings
nvim_set_keymap("n", "<Leader>rt", ":TestFile<CR>",
                { noremap = true, silent = true })
nvim_set_keymap("n", "<Leader>rl", ":TestNearest<CR>",
                { noremap = true, silent = true })
nvim_set_keymap("n", "<Leader>rs", ":TestSuite<CR>",
                { noremap = true, silent = true })

-- Use ' instead of ` when navigating to the position of a mark
nvim_set_keymap("n", "'", "`", { noremap = true })

-- Allow the file under the cursor to be opened even if it does not exist
nvim_set_keymap("n", "<Leader>gf", ":e <cfile><CR>",
                { noremap = true, silent = true })

-- Edit file
nvim_set_keymap("n", "<Leader>ee", ":e<Space>", { noremap = true })

-- Sort visual selection
nvim_set_keymap("x", "<Leader>ss", ":!sort<CR>",
                { noremap = true, silent = true })

-- Go to the beginning and end of the line in command mode
nvim_set_keymap("c", "<C-a>", "<Home>", { noremap = true })
nvim_set_keymap("c", "<C-e>", "<End>", { noremap = true })

-- Replace instances of a word under the cursor (similar to multiple cursors)
nvim_set_keymap("n", "<C-n>", "*Ncgn", { noremap = true })

-- Save and load sessions
nvim_set_keymap("n", "<Leader>ms", ":mksession!<CR>",
                { noremap = true, silent = true })
nvim_set_keymap("n", "<Leader>ls", ":source Session.vim<CR>",
                { noremap = true, silent = true })

-- Emacs-style navigation in insert mode
nvim_set_keymap("i", "<C-e>", "<C-o>$", {})
nvim_set_keymap("i", "<C-a>", "<C-o>^", {})

-- Mappings for navigation the quickfix list
nvim_set_keymap("n", "[q", ":cprevious<CR>", { noremap = true, silent = true })
nvim_set_keymap("n", "]q", ":cnext<CR>", { noremap = true, silent = true })
nvim_set_keymap("n", "[Q", ":cfirst<CR>", { noremap = true, silent = true })
nvim_set_keymap("n", "]Q", ":clast<CR>", { noremap = true, silent = true })

-- Marginalia-related mappings
nvim_set_keymap("n", "<Leader>mnn", ":MarginaliaNew<Space>", { noremap = true })
nvim_set_keymap("n", "<Leader>men", ":MarginaliaEdit<Space>", { noremap = true })
nvim_set_keymap("n", "<Leader>mln", ":MarginaliaList<CR>",
                { noremap = true, silent = true })
nvim_set_keymap("n", "<Leader>mfb", ":MarginaliaFindBacklinks<CR>",
                { noremap = true, silent = true })

nvim_set_keymap("n", "<Leader>mft", ":MarginaliaFindTagReferences<Space>",
                { noremap = true })
nvim_set_keymap("n", "<Leader>mcw", ":MarginaliaConvertWordToTag<CR>",
                { noremap = true, silent = true })

-- ALE-related mappings
nvim_set_keymap("n", "<Leader>ad", ":ALEDetail<CR>",
                { noremap = true, silent = true })
nvim_set_keymap("n", "<Leader>af", ":ALEFindReferences -relative<CR>",
                { noremap = true, silent = true })
nvim_set_keymap("n", "<Leader>ag", ":ALEGoToDefinition<CR>",
                { noremap = true, silent = true })
nvim_set_keymap("n", "<Leader>ah", ":ALEHover<CR>",
                { noremap = true, silent = true })
nvim_set_keymap("n", "<Leader>ar", ":ALERename<CR>",
                { noremap = true, silent = true })

-- Use NetRw to open file under the cursor
-- See https://github.com/kyazdani42/nvim-tree.lua/issues/47#issuecomment-658266288
nvim_set_keymap("n", "gx",
                ":call netrw#BrowseX(expand('<cfile>'), netrw#CheckIfRemote())<CR>",
                { noremap = true, silent = true })

-- Reselect pasted text
nvim_set_keymap("n", "gp", "`[v`]", { noremap = true })

-- Add `end` to functions in Ruby, Lua, and Elixir
nvim_set_keymap("i", "<CR>", "v:lua.npairs.autopairs_cr()",
                { expr = true, noremap = true })

-- Keep the current search result centered in the viewport when jumping
nvim_set_keymap("n", "n", "nzz", { noremap = true })
nvim_set_keymap("n", "N", "Nzz", { noremap = true })

-- Move visual selection up/down
nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })
nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })

-- Open completion menus with Ctrl-Space
nvim_set_keymap("i", "<C-Space>", "<C-x><C-o>",
                { noremap = true, silent = true })
