return {
	{
		"echasnovski/mini.nvim",
		version = false,
		event = { "VeryLazy" },
		config = function()
			require("mini.ai").setup()
			require("mini.statusline").setup()
		end,
	},
}
