-- ~/.config/nvim/lua/plugins/conform.lua
-- Formatter on save using conform.nvim
return {
    {
        'stevearc/conform.nvim',
        lazy = false,
        config = function()
            require('conform').setup({
                format_on_save = {
                    lsp_fallback = true,
                    timeout_ms = 2000,
                },
                formatters_by_ft = {
                    lua        = { 'stylua' },
                    python     = { 'black' },
                    javascript = { 'prettier' },
                    cpp        = { 'clang-format' },
                },
            })
        end,
    },
}

