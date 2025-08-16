return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "css",
          "go",
          "gomod",
          "gosum",
          "html",
          "javascript",
          "json",
          "just",
          "lua",
          "markdown",
          "markdown_inline",
          "regex",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
        },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        indent = { enable = true },
      })
    end,
  },
}
