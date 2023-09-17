return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = function()
			return {
				options = {
					theme = "auto",
					globalstatus = true,
				},
			}
		end,
	},
}
