-- ~/.config/nvim/lua/plugins/treesitter.lua
-- Treesitter setup for enhanced syntax highlighting and more

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate', -- Command to install/update parsers
    event = { "BufReadPost", "BufNewFile" }, -- Load on buffer read/new file
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects', -- Optional: Text objects based on treesitter
    },
    config = function()
      require('nvim-treesitter.configs').setup({
        -- Ensure C, C++, Lua, Vim are installed (add other languages as needed)
        ensure_installed = { 'c', 'cpp', 'lua', 'vim', 'vimdoc', 'markdown', 'bash', 'json', 'yaml', 'html', 'css', 'javascript', 'typescript' },
        -- Or use 'all' to install all available parsers (takes time/space)
        -- ensure_installed = 'all',

        sync_install = false,  -- Install parsers asynchronously
        auto_install = true,   -- Automatically install missing parsers when opening files

        highlight = {
          enable = true,         -- Enable syntax highlighting
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },

        indent = {
          enable = true,        -- Enable indentation based on treesitter (experimental)
          -- disable = { 'python' }, -- Disable for specific languages if needed
        },

        -- Optional: Configure textobjects if dependency is installed
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              -- Add more text object mappings here
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
        },
      })
      print("Treesitter setup complete.")
    end,
  },
}
