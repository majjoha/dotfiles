-- Add FZF to the `runtimepath`
vim.opt.runtimepath = vim.o.runtimepath ..
                        ',/usr/local/opt/fzf,/opt/homebrew/opt/fzf/'

-- Use only `filetype.lua` and not `filetype.vim`
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0
