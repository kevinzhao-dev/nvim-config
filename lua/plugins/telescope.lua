-- ~/.config/nvim/lua/plugins/telescope.lua
-- Telescope fuzzy finder setup

return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x', -- Use the stable branch
    dependencies = {
      'nvim-lua/plenary.nvim', -- Required dependency
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }, -- Optional: Faster sorting (requires build tools & fzf)
      { 'nvim-tree/nvim-web-devicons' }, -- For icons in Telescope results
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.setup({
        defaults = {
          path_display = { 'smart' }, -- Display paths smartly
          mappings = {
            i = {
              ['<C-k>'] = actions.move_selection_previous, -- Move up
              ['<C-j>'] = actions.move_selection_next, -- Move down
              ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist, -- Send to quickfix list
              ['<Esc>'] = actions.close,
            },
            n = {
              ['<C-k>'] = actions.move_selection_previous,
              ['<C-j>'] = actions.move_selection_next,
              ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
          sorting_strategy = "ascending",
          layout_strategy = 'horizontal', -- Or 'vertical', 'flex'
          layout_config = {
             horizontal = { preview_width = 0.6 }, -- 60% width for preview
             -- vertical = { mirror = false },
          },
        },
        pickers = {
          -- Configure specific pickers if needed
          find_files = {
             -- theme = "dropdown", -- Example theme
             hidden = true, -- Show hidden files
          },
          live_grep = {
             -- theme = "dropdown",
          },
          buffers = {
             -- theme = "dropdown",
             sort_mru = true,
             ignore_current_buffer = true,
          },
        },
        extensions = {
          fzf = { -- Options for fzf-native extension
            fuzzy = true,                    -- Enable fuzzy finding
            override_generic_sorter = true,  -- Override the generic sorter
            override_file_sorter = true,     -- Override the file sorter
            case_mode = 'smart_case',        -- Smart case sensitivity
          }
        }
      })

      -- Load extensions
      pcall(telescope.load_extension, 'fzf') -- Load fzf extension if installed

      -- Keymaps for Telescope
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
      vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = '[F]ind [O]ld Files' })
      vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = '[F]ind [S]ymbols (Document)'})
      vim.keymap.set('n', '<leader>fS', builtin.lsp_dynamic_workspace_symbols, { desc = '[F]ind [S]ymbols (Workspace)'})
      vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = '[F]ind LSP [R]eferences'})
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics'})
      vim.keymap.set('n', '<leader>:', builtin.command_history, { desc = '[F]ind Command History' })
    end,
  },
}
