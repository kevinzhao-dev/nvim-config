-- ~/.config/nvim/lua/core/options.lua
-- Neovim core options setup

-- [[ Leader Key ]]
-- Set leader key BEFORE loading plugins / keymaps
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Editor Behavior ]]
vim.opt.number = true             -- Show line numbers
vim.opt.relativenumber = true     -- Show relative line numbers
vim.opt.mouse = 'a'               -- Enable mouse support in all modes
vim.opt.clipboard = 'unnamedplus' -- Use system clipboard (requires 'unnamedplus')
vim.opt.breakindent = true        -- Preserve indentation with wrapped lines
vim.opt.undofile = true           -- Persist undo history
-- vim.opt.undodir = vim.fn.stdpath('data') .. '/undodir' -- Optional: Set undo directory

-- [[ Search ]]
vim.opt.ignorecase = true         -- Ignore case when searching
vim.opt.smartcase = true          -- Override ignorecase if search pattern has uppercase letters
vim.opt.hlsearch = true           -- Highlight search results
vim.opt.incsearch = true          -- Show search results incrementally

-- [[ Whitespace ]]
vim.opt.tabstop = 4               -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 4            -- Size of an indent
vim.opt.softtabstop = 4           -- Number of spaces <Tab> inserts / <BS> deletes
vim.opt.expandtab = true          -- Use spaces instead of tabs

-- [[ Appearance ]]
vim.opt.termguicolors = true      -- Enable 24-bit RGB colors
vim.opt.signcolumn = 'yes'        -- Always show the sign column to prevent layout shifts
vim.opt.wrap = false              -- Disable line wrapping
vim.opt.scrolloff = 8             -- Minimum number of screen lines to keep above/below cursor
vim.opt.sidescrolloff = 8         -- Minimum number of screen columns to keep to the left/right of cursor

-- [[ Performance / System ]]
vim.opt.updatetime = 250          -- Faster completion popups / GitGutter updates
vim.opt.timeoutlen = 300          -- Reduce delay for mapped sequences
vim.opt.completeopt = 'menuone,noselect' -- Autocompletion options
vim.opt.conceallevel = 0          -- Don't hide markdown characters, etc.
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- Improve commenting behavior

-- Disable swap, backup files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

print("Core options loaded.")
-- No need to return anything from this file
