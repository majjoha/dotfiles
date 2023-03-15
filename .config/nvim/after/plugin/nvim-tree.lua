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
  view = {
    float = {
      enable = true,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_w = screen_w / 2
        local window_h = screen_h / 1.5

        return {
          border = "single",
          relative = "editor",
          row = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get(),
          col = (screen_w - window_w) / 2,
          width = math.floor(window_w),
          height = math.floor(window_h),
        }
      end,
    },
    width = function()
      return math.floor(vim.opt.columns:get() / 2)
    end,
  },
})
