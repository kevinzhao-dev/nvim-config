-- ~/.config/nvim/lua/plugins/core.lua
-- Core UI plugins like theme, statusline, icons

return {
  -- Icons (needed by many plugins)
  { 'nvim-tree/nvim-web-devicons', lazy = true },

  -- Theme: Tokyonight (Example)
  {
    'folke/tokyonight.nvim',
    lazy = false,    -- Load theme at startup
    priority = 1000, -- Ensure it loads first
    opts = {},       -- Use opts = {} or config = function() for setup
    config = function(_, opts) -- Pass opts table to config if needed
        require('tokyonight').setup(opts) -- Setup with opts
        vim.cmd.colorscheme 'tokyonight' -- Apply the theme
    end,
  },
  -- Alternative Theme: Catppuccin (Commented out)
  -- {
  --   "catppuccin/nvim",
  --   lazy = false,
  --   name = "catppuccin",
  --   priority = 1000,
  --   opts = {
  --     flavour = "macchiato", -- latte, frappe, macchiato, mocha
  --     -- ... other catppuccin options
  --   },
  --   config = function(_, opts)
  --     require("catppuccin").setup(opts)
  --     vim.cmd.colorscheme 'catppuccin'
  --   end,
  -- },


  -- Status Line: Lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Needs icons
    opts = { -- Configure lualine using opts table
      options = {
        -- icons_enabled = true, -- Enabled by default if devicons installed
        theme = 'auto', -- Use 'auto' or match your theme ('tokyonight')
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false, -- Use per-window statuslines
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {{'filename', path = 1}}, -- Show relative path
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {{'filename', path = 1}},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {'nvim-tree', 'toggleterm'} -- Enable extensions if using these plugins
    },
  },
}
