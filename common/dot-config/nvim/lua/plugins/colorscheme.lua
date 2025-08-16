return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{
		"dracula/vim",
		name = "dracula",
		lazy = false,
		priority = 1000,
	},
	{
		"oxfist/night-owl.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"vague2k/vague.nvim",
		lazy = false,
		priority = 1000,
	},
}
