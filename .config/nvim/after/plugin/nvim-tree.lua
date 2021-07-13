-- Skip if NvimTree is not loaded
if not vim.g.loaded_tree then
  return
end

--  NvimTree does not respect the options `g:nvim_tree_hijack_netrw` and 
--  `g:nvim_tree_disable_netrw` when they are set in the `after` directory.
--  Netrw is needed for `gx`, however, so reload it here.
--  See https://github.com/kyazdani42/nvim-tree.lua/issues/47#issuecomment-658266288
vim.cmd([[
  unlet! g:loaded_netrw
  unlet! g:loaded_netrwPlugin
  runtime! plugin/netrwPlugin.vim
]])

-- Append trailing slash to folder names
vim.g.nvim_tree_add_trailing = 1

-- Disable the window picker to allow more than two splits
vim.g.nvim_tree_disable_window_picker = 1

-- Don't display these kind of files
-- LuaFormatter off
vim.g.nvim_tree_ignore = {
  ".class$",
  ".o$",
  ".git",
  ".DS_Store",
  ".aux",
  ".idr~",
  ".ibc",
  ".prefab",
  ".meta",
  ".beam",
}
-- LuaFormatter on

-- Change default icons
-- LuaFormatter off
vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 0,
  folder_arrows = 1,
}
-- LuaFormatter on

-- LuaFormatter off
vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "",
    unmerged = "",
    renamed = "",
    untracked = "",
    deleted = "",
    ignored = "",
  },
  folder = {
    arrow_open = "",
    arrow_closed = "",
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = "",
  },
  lsp = {
    hint = "",
    info = "",
    warning = "",
    error = ""
  },
}
-- LuaFormatter on
