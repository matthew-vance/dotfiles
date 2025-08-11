return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
  keys = function()
    local oil = require("oil")
    return {
      { "<leader>e", oil.toggle_float, desc = "Toggle [E]xplorer" },
    }
  end,
}
