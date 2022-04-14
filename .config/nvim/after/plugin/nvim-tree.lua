-- Append trailing slash to folder names
vim.g.nvim_tree_add_trailing = 1

-- Change default icons
-- LuaFormatter off
vim.g.nvim_tree_show_icons = {
  files = 0,
  folder_arrows = 1,
  folders = 1,
  git = 0,
}
-- LuaFormatter on

-- LuaFormatter off
vim.g.nvim_tree_icons = {
  default = "",
  folder = {
    arrow_closed = "",
    arrow_open = "",
    default = "",
    empty = "",
    empty_open = "",
    open = "",
    symlink = "",
    symlink_open = "",
  },
  git = {
    deleted = "",
    ignored = "",
    renamed = "",
    staged = "",
    unmerged = "",
    unstaged = "",
    untracked = "",
  },
  lsp = {
    error = "",
    hint = "",
    info = "",
    warning = "",
  },
  symlink = "",
}
-- LuaFormatter on

require("nvim-tree").setup({
  -- Enable Netrw as it is needed for `gx`
  disable_netrw = false,
  filters = {
    -- Ignore the following files
    custom = {
      ".DS_Store", ".aux", ".beam", ".class$", ".git", ".ibc", ".meta", ".o$", ".prefab",
    },
  },
  actions = {
    open_file = {
      -- Disable the window picker to allow more than two splits
      window_picker = {
        enable = false
      }
    }
  }
})
