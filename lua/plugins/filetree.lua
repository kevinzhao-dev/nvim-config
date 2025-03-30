-- ~/.config/nvim/lua/plugins/filetree.lua
-- Nvim-Tree file explorer setup

return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Needs icons
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" }, -- Commands to load the plugin
    keys = { -- Keymaps to load the plugin
       { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer" },
       { "<leader>o", "<cmd>NvimTreeFindFile<cr>", desc = "Find File in Explorer"},
    },
    opts = { -- Configure nvim-tree using opts
      sort_by = 'case_sensitive',
      view = {
        adaptive_size = true, -- Adjusts width automatically
        -- width = 30, -- Or set fixed width
        side = 'left',
        -- number = true,
        -- relativenumber = true,
      },
      renderer = {
        group_empty = true, -- Show empty folders
        highlight_git = true, -- Highlight git status
        icons = {
           show = { file = true, folder = true, git = true },
           glyphs = { -- Customize icons if desired
              -- default = "",
              -- symlink = "",
              -- folder = { arrow_closed = "", arrow_open = "", default = "", open = "", empty = "", empty_open = "" },
              -- git = { unstaged = "", staged = "", unmerged = "", renamed = "➜", untracked = "", deleted = "", ignored = "◌" },
           },
        },
      },
      filters = {
        dotfiles = false, -- Hide dotfiles by default
        custom = { '.git', 'node_modules', '.cache' }, -- Hide specific files/folders
        exclude = {},
      },
      git = {
        enable = true,
        ignore = false, -- Show files ignored by git?
        timeout = 400,
      },
      actions = {
        open_file = {
          quit_on_open = false, -- Keep explorer open after opening file
          resize_window = true, -- Resize window when opening files
        },
      },
      update_focused_file = { -- Update tree when changing buffers
        enable = true,
        update_root = false, -- Keep root directory same
      },
      -- diagnostics = { -- Show diagnostics in the tree
      --   enable = true,
      --   show_on_dirs = true,
      --   icons = { hint = "", info = "", warning = "", error = "" },
      -- },
    },
  },
}
