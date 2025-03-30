-- ~/.config/nvim/lua/plugins/ui.lua

return { -- <--- 確保整個檔案返回一個表格

  -- 主題：Tokyonight
  { -- <--- 這是 tokyonight 的外掛規格表格
    'folke/tokyonight.nvim',
    lazy = false, -- 建議主題在啟動時就載入
    priority = 1000, -- 確保優先載入 (在其他需要語法高亮的插件之前)
    config = function()
      -- 在這裡載入您選擇的色彩主題
      vim.cmd.colorscheme 'tokyonight' -- 或 tokyonight-storm, tokyonight-moon, tokyonight-day

      require('tokyonight').setup({
          style = "storm",
          transparent = true
      })

      -- 如果需要更詳細的設定，可以在這裡調用 setup
      -- require('tokyonight').setup({
      --   style = "storm", -- 可選： "storm", "night", "moon", "day"
      --   -- transparent = true, -- 可選：啟用透明背景
      --   -- ... 其他 tokyonight 選項
      -- })
    end,
  }, -- <--- tokyonight 外掛規格結束

  -- 如果您決定使用 Catppuccin，可以註解掉上面的 Tokyonight，然後取消註解下面的區塊
  -- 或者只保留您想用的那一個
  -- { -- <--- 這是 Catppuccin 的外掛規格表格
  --   "catppuccin/nvim",
  --   name = "catppuccin", -- 給這個外掛設定一個名字 (可選，但有時有用)
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('catppuccin').setup({
  --       flavour = "macchiato", -- 可選: latte, frappe, macchiato, mocha
  --       -- ... 其他 catppuccin 選項
  --     })
  --     vim.cmd.colorscheme 'catppuccin'
  --   end,
  -- }, -- <--- Catppuccin 外掛規格結束

  -- 您可以在這個檔案裡繼續加入其他 UI 相關的外掛，例如 lualine
  -- {
  --   'nvim-lualine/lualine.nvim',
  --    dependencies = { 'nvim-tree/nvim-web-devicons' },
  --    config = function() ... end
  -- },

} -- <--- return 表格結束
