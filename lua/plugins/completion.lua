-- ~/.config/nvim/lua/plugins/completion.lua
-- Advanced completion settings (if not fully covered by lsp-zero)

return {
  -- Example: Add friendly-snippets if desired
  -- {
  --   "rafamadriz/friendly-snippets",
  --   dependencies = { "L3MON4D3/LuaSnip" },
  --   config = function()
  --     require("luasnip.loaders.from_vscode").lazy_load()
  --   end,
  -- },

  -- Example: Configure specific cmp sources or LuaSnip options
  -- {
  --    'hrsh7th/nvim-cmp', -- Ensure this runs AFTER lsp-zero setup if modifying its config
  --    opts = function(_, opts) -- Modify opts table provided by lsp-zero or defaults
  --       -- Example: Add a new source or change mapping
  --       table.insert(opts.sources, { name = 'calc' }) -- If cmp-calc was installed
  --       opts.mapping['<C-n>'] = nil -- Remove a default mapping
  --       return opts -- Return the modified options
  --    end,
  -- },
}
-- If lsp-zero setup is sufficient, this file can be empty or deleted.
