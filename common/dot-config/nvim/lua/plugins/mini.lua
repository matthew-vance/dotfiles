return {
  {
    "echasnovski/mini.nvim",
    event = { "VeryLazy" },
    config = function()
      require("mini.ai").setup()
      require("mini.cursorword").setup()
      require("mini.icons").setup()
      require("mini.jump").setup({
        delay = {
          idle_stop = 3000,
        },
      })
      require("mini.pairs").setup()
      require("mini.surround").setup()
    end,
  },
}
