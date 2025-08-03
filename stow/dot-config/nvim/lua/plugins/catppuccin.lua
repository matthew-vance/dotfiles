return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 2000,
    name = "catppuccin",
    opts = {
      flavour = "mocha",
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)

      vim.cmd([[colorscheme catppuccin]])
    end,
  },
}
