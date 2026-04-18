-- Built-in plugin manager introduced in Neovim 0.12. See :h vim.pack and
-- https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack
vim.pack.add({
	"https://github.com/nvim-mini/mini.nvim",
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
	"https://github.com/folke/snacks.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/stevearc/conform.nvim",
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("1.*") },
})

-- Load order matters: mini.icons must be set up before oil reads it.
require("plugins.mini")
require("plugins.catppuccin")
require("plugins.oil")
require("plugins.snacks")
require("plugins.conform")
require("plugins.blink")
