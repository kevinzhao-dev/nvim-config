return {
{
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- 需要圖示
  config = function()
    require('nvim-tree').setup({
      -- 這裡可以加入你的 nvim-tree 設定
      sort_by = 'case_sensitive',
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true, -- 顯示隱藏檔
      },
      git = {
          enable = true,
          ignore = false, -- 顯示 gitignored 檔案
      },
    })
    -- 設定快捷鍵
    vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
    vim.keymap.set('n', '<leader>o', ':NvimTreeFindFile<CR>', { desc = 'NvimTree Find File'})
  end,
},
}
