-- Map leader key to space
vim.keymap.set("n", "<Leader>", "<Nop>", { remap = true, silent = false })
vim.g.mapleader = " "

-- Use Control-S for saving
vim.keymap.set("i", "<C-s>", "<C-o>:update<CR>", { silent = true })
vim.keymap.set("n", "<C-s>", ":update<CR>", { silent = true })

-- Use Control-Q for quitting
vim.keymap.set("n", "<C-q>", ":q<CR>", { silent = true })
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>:q<CR>", { silent = true })

-- Open the current buffer in a new tab
vim.keymap.set("n", "<Leader>mw", function()
  local current_pos = vim.fn.getcurpos()
  local tabedit = [[tabedit %]]
  vim.cmd(tabedit)
  vim.fn.setpos(".", current_pos)
end, { silent = true })

-- Close the current tab
vim.keymap.set("n", "<Leader>cw", ":tabc<CR>", { silent = true })

-- Keep the visual selection when indenting/outdenting
vim.keymap.set("x", ">", ">gv")
vim.keymap.set("x", "<", "<gv")

-- Navigate screen lines instead of file lines
vim.keymap.set("", "k", "gk")
vim.keymap.set("", "j", "gj")

-- Toggle MiniFiles
vim.keymap.set("n", "<Leader>d", function(...)
  if not MiniFiles.close() then
    MiniFiles.open(...)
  end
end, { silent = true })
vim.keymap.set("n", "<Leader>D", function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0))
end)

-- Search the contents of the files in the current directory
vim.keymap.set("n", "<Leader>f", ":FzfLua grep_project<CR>", { silent = true })

-- Search buffers
vim.keymap.set("n", "<Leader>bb", ":FzfLua buffers<CR>", { silent = true })

-- Search files
vim.keymap.set("n", "<Leader>p", ":FzfLua files<CR>", { silent = true })

-- Search commands
vim.keymap.set("n", "<Leader>cc", ":FzfLua commands<CR>", { silent = true })

-- Search file types
vim.keymap.set("n", "<Leader>sf", ":FzfLua filetypes<CR>", { silent = true })

-- Search help files
vim.keymap.set("n", "<Leader>h", ":FzfLua help_tags<CR>", { silent = true })

-- Remove search highlighting
vim.keymap.set("n", "<Leader><Leader>", ":let @/ = ''<CR>", { silent = true })

-- Open vertical split
vim.keymap.set("n", "<Leader>v", ":vsp<CR>", { silent = true })

-- Open horizontal split
vim.keymap.set("n", "<Leader>x", ":sp<CR>", { silent = true })

-- Git-related mappings
vim.keymap.set("n", "<Leader>bc", ":FzfLua git_commits<CR>", { silent = true })
vim.keymap.set("n", "<Leader>gb", ":Git blame<CR>", { silent = true })
vim.keymap.set("n", "<Leader>gc", ":tab Git commit -v<CR>")
vim.keymap.set("n", "<Leader>gcb", ":Git checkout -b<Space>")
vim.keymap
  .set("n", "<Leader>gco", ":FzfLua git_branches<CR>", { silent = true })
vim.keymap.set("n", "<Leader>gd", ":Gdiffsplit<CR>", { silent = true })
vim.keymap.set("n", "<Leader>gr", ":Git rebase -i origin/main<CR>",
               { silent = true })
vim.keymap.set("n", "<Leader>gs", ":Git<CR>", { silent = true })
vim.keymap.set("n", "<Leader>gg", ":Git<Space>")
vim.keymap.set("n", "<Leader>gpr", ":!git pr<CR>", { silent = true })
vim.keymap.set("n", "<Leader>gpp", ":Git pull<CR>", { silent = true })
vim.keymap.set("n", "<Leader>ga", ":Gwrite<CR>", { silent = true })
vim.keymap.set("n", "<Leader>gl", ":tabe | terminal tig<CR>", { silent = true })

-- Edit snippets for the current file type
vim.keymap.set("n", "<Leader>es", ":SnippyEdit<Space>")

-- Open a terminal in a split window
vim.keymap.set("n", "<Leader>tv", ":vsp | term<CR>", { silent = true })
vim.keymap.set("n", "<Leader>ts", ":sp | term<CR>", { silent = true })

-- Search in visual selection
vim.keymap.set("x", "/", "<ESC>/\\%V")

-- Test-related mappings
vim.keymap.set("n", "<Leader>rt", ":TestFile<CR>", { silent = true })
vim.keymap.set("n", "<Leader>rl", ":TestNearest<CR>", { silent = true })
vim.keymap.set("n", "<Leader>rs", ":TestSuite<CR>", { silent = true })

-- Use ' instead of ` when navigating to the position of a mark
vim.keymap.set("n", "'", "`")

-- Allow the file under the cursor to be opened even if it does not exist
vim.keymap.set("n", "<Leader>gf", ":e <cfile><CR>", { silent = true })

-- Edit file
vim.keymap.set("n", "<Leader>ee", ":e<Space>")

-- Sort visual selection
vim.keymap.set("x", "<Leader>ss", ":!sort<CR>", { silent = true })

-- Go to the beginning and end of the line in command mode
vim.keymap.set("c", "<C-a>", "<Home>")
vim.keymap.set("c", "<C-e>", "<End>")

-- Replace instances of a word under the cursor (similar to multiple cursors)
vim.keymap.set("n", "<C-n>", "*Ncgn")

-- Save and load sessions
vim.keymap.set("n", "<Leader>ms", ":mksession!<CR>", { silent = true })
vim.keymap.set("n", "<Leader>ls", ":source Session.vim<CR>", { silent = true })

-- Emacs-style navigation in insert mode
vim.keymap.set("i", "<C-e>", "<C-o>$")
vim.keymap.set("i", "<C-a>", "<C-o>^")

-- Marginalia-related mappings
vim.keymap.set("n", "<Leader>mnn", ":MarginaliaNew<Space>")
vim.keymap.set("n", "<Leader>men", ":MarginaliaEdit<Space>")
vim.keymap.set("n", "<Leader>mln", ":MarginaliaList<CR>", { silent = true })
vim.keymap.set("n", "<Leader>mfb", ":MarginaliaFindBacklinks<CR>",
               { silent = true })
vim.keymap.set("n", "<Leader>mft", ":MarginaliaFindTagReferences<Space>", {})
vim.keymap.set("n", "<Leader>mcw", ":MarginaliaConvertWordToTag<CR>",
               { silent = true })

-- LSP-related mappings
vim.keymap.set("n", "<Leader>la",
               ":FzfLua lsp_code_actions previewer=codeaction_native<CR>",
               { silent = true })
vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.references, { silent = true })
vim.keymap.set("n", "<Leader>ln", vim.lsp.buf.rename, { silent = true })
vim.keymap.set("n", "<Leader>lp", vim.lsp.buf.hover, { silent = true })

-- Reselect pasted text
vim.keymap.set("n", "gp", "`[v`]")

-- Add `end` to functions in Ruby, Lua, and Elixir
vim.keymap.set("i", "<CR>", require("nvim-autopairs").autopairs_cr,
               { expr = true })

-- Keep the current search result centered in the viewport when jumping
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Move visual selection up/down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Open completion menu with C-Space
vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { silent = true })

-- Select completion items
vim.keymap.set("i", "<S-Tab>", function()
  if vim.fn.pumvisible() then
    return "<C-y>"
  else
    return "<S-Tab>"
  end
end, { expr = true, replace_keycodes = true })

vim.keymap.set("i", "<C-j>", function()
  if vim.fn.pumvisible() then
    return "<C-n>"
  else
    return "<C-j>"
  end
end, { expr = true, replace_keycodes = true })

vim.keymap.set("i", "<C-k>", function()
  if vim.fn.pumvisible() then
    return "<C-p>"
  else
    return "<C-k>"
  end
end, { expr = true, replace_keycodes = true })

-- Move between windows without having to use <C-w>
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("t", "<C-h>", "<C-w><C-h>")
vim.keymap.set("t", "<C-l>", "<C-w><C-l>")
vim.keymap.set("t", "<C-j>", "<C-w><C-j>")
vim.keymap.set("t", "<C-k>", "<C-w><C-k>")

-- Move between implementation and tests
vim.keymap.set("n", "<Tab>", require("other-nvim").open)

-- Mimic mappings from splitjoin.vim
vim.keymap.set("n", "gS", ":TSJSplit<CR>", { silent = true })
vim.keymap.set("n", "gJ", ":TSJJoin<CR>", { silent = true })
