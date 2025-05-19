-- ~/.config/nvim/lua/plugins/lsp.lua
-- Language Server Protocol setup

return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = false, -- Or set lazy = true and use dependencies/event/cmd triggers
    dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional: Auto-install LSPs
        {'williamboman/mason-lspconfig.nvim'}, -- Optional: Bridge mason & lspconfig

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required for snippet support
        -- Add other completion sources like cmp-buffer, cmp-path...
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'}, -- Snippet integration for cmp
    },
    config = function()
        local lsp_zero = require('lsp-zero').preset({})

        lsp_zero.on_attach(function(client, bufnr)
            -- LSP-Zero keybindings, see :help lsp-zero-keybindings
            lsp_zero.default_keymaps({buffer = bufnr})

            -- Additional keybindings or logic on attach
            vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format { async = true } end,
                           { buffer = bufnr, desc = 'Format code' })
        end)

        -- Setup Mason and Mason-LSPConfig to install servers
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {'clangd', 'lua_ls', 'rust_analyzer'}, -- ** Add C++, Lua, Rust LSPs here **
            handlers = {
                lsp_zero.default_setup_servers, -- Use lsp-zero's handler
                -- You can add custom setup for specific servers if needed
                lua_ls = function()
                    local lspconfig = require('lspconfig')
                    lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
                end,
                clangd = function()
                    local lspconfig = require('lspconfig')
                    lspconfig.clangd.setup({
                        -- Add clangd specific settings if necessary
                        -- cmd = { "clangd", "--compile-commands-dir=..." },
                        on_attach = function(client, bufnr)
                           lsp_zero.default_keymaps({buffer = bufnr})
                           -- Clangd specific keymaps or settings on attach
                        end,
                    })
                end,
            }
        })

        -- (Optional) Setup diagnostics signs/virtual text using lsp-zero
        lsp_zero.set_sign_icons({
            error = '',
            warn = '',
            info = '',
            hint = ''
        })
        -- vim.diagnostic.config({ virtual_text = true }) -- Enable virtual text diagnostics

    end
  },
}

-- Note: lsp-zero simplifies setting up lspconfig, mason, and nvim-cmp together.
-- If you prefer manual setup, you would define nvim-lspconfig, mason.nvim,
-- mason-lspconfig.nvim, and nvim-cmp + its sources as separate plugin specs here.
-- The previous examples showed the manual setup. This uses lsp-zero for brevity.

