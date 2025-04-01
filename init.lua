-- ~/.config/nvim/init.lua
-- Neovim configuration entry point
-- Last reviewed: 2025-03-29

-- [[ Install `lazy.nvim` package manager ]]
--    See https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath) -- Add lazy.nvim to runtime path

-- [[ Load Core Settings ]]
-- Load basic Neovim options first
require('core.options')
-- require('core.keymaps') -- 如果您有 core/keymaps.lua 檔案

-- [[ Setup `lazy.nvim` ]]
-- Tell lazy to load plugin specifications from lua/plugins/ directory
require('lazy').setup('plugins', {
  -- lazy.nvim configuration options go here (optional)
  checker = {
    enabled = true, -- Automatically check for plugin updates
    notify = false, -- Don't notify on startup, check with :Lazy check
  },
  change_detection = {
    notify = false, -- Don't notify when detecting changes in plugins
  },
  -- You can add performance tuning options here if needed later
  -- performance = { ... }
})


