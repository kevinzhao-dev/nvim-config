-- ~/.config/nvim/lua/plugins/utils.lua
-- Utility plugins like commenting, autopairs, etc.

return {
  -- Commenting plugin
  {
    'numToStr/Comment.nvim',
    event = "BufReadPost", -- Load when a buffer is read
    opts = { -- Configure using opts
      -- Add any options here, for example:
      -- pre_hook = function(ctx) ... end,
      -- post_hook = function(ctx) ... end,
    },
    -- Or use config function for keymaps
    config = function(_, opts)
        require('Comment').setup(opts)
        -- Optional: Setup custom keymaps if needed, otherwise defaults are usually fine (gcc, gc<motion>)
    end,
  },

  -- Autopairs plugin
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter", -- Load when entering insert mode
    opts = { -- Configure using opts
      -- disable_filetype = { "TelescopePrompt" , "vim" }, -- Example: disable for specific filetypes
      -- check_ts = true, -- Enable treesitter integration (recommended)
      -- ts_config = {
      --     lua = {'string'},-- Don't add pairs inside lua strings
      --     javascript = {'template_string'}, -- Don't add pairs inside js template strings
      --     java = false, -- don't check treesitter on java
      -- }
    },
    config = function(_, opts)
       require('nvim-autopairs').setup(opts)
       -- Optional: If you have nvim-cmp setup, integrate autopairs
       local cmp_autopairs = require('nvim-autopairs.completion.cmp')
       local cmp = require('cmp')
       if cmp then -- Check if cmp is loaded
           cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done())
       end
    end,
  },

  -- Optional: Indent lines visualization
  -- {
  --   'lukas-reineke/indent-blankline.nvim',
  --   main = "ibl", -- Use 'ibl' module name
  --   event = { "BufReadPost", "BufNewFile" },
  --   opts = {
  --     -- default options:
  --     -- indent = { char = "│", tab_char = "│" },
  --     -- whitespace = { remove_blankline_indent = false },
  --     -- scope = { enabled = true, show_start = true, show_end = true },
  --   },
  -- },
}
