return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		lazy = false,
		keys = function()
			local oil = require("oil")
			return {
				{
					"<leader>e",
					function()
						oil.toggle_float()
					end,
					desc = "Toggle Explorer",
				},
			}
		end,
	},
}
