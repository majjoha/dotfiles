require("nvim-tree").setup({
  -- Enable Netrw as it is needed for `gx`
  disable_netrw = false,
  filters = {
    -- Ignore the following files
    custom = { ".DS_Store", ".aux", ".beam", ".class$", ".git", ".ibc", ".meta" },
  },
  actions = {
    open_file = {
      -- Disable the window picker to allow more than two splits
      window_picker = { enable = false },
    },
  },
  renderer = {
    add_trailing = true,
    icons = {
      show = {
        file = false,
        folder = true,
        folder_arrow = true,
        git = false,
      },
      glyphs = {
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
      },
    },
  },
  git = { enable = true, ignore = false },
})
