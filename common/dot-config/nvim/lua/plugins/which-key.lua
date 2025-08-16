return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
			delay = 1000,
			spec = {
				{
					"<leader>b",
					group = "Buffer",
					expand = function()
						return require("which-key.extras").expand.buf()
					end,
				},
				{ "<leader>f", group = "Find/Format" },
				{ "<leader>g", group = "Git" },
				{ "<leader>q", group = "Session" },
				{ "<leader>s", group = "Search" },
				{ "<leader>u", group = "UI" },
				{ "gz", group = "Surround" },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
