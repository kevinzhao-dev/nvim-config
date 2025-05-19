-- ~/.config/nvim/lua/plugins/dap.lua
-- Debug Adapter Protocol (DAP) and UI setup

return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    opts = {},
    config = function(_, opts)
      require("dapui").setup(opts)
    end,
  },
}