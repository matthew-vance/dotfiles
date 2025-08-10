return {
	{
		"ggandor/leap.nvim",
		dependencies = { { "tpope/vim-repeat", event = "VeryLazy" } },
		config = function()
			require("leap").add_default_mappings()
		end,
		keys = {
			{ "s", "<Plug>(leap-anywhere)", desc = "Leap anywhere" },
			{ "s", "<Plug>(leap)", mode = { "x", "o" }, desc = "Leap" },
			{
				"R",
				function()
					require("leap.treesitter").select({ opts = require("leap.user").with_traversal_keys("R", "r") })
				end,
				mode = { "x", "o" },
				desc = "Leap Treesitter",
			},
		},
	},
	{
		"ggandor/flit.nvim",
		opts = {},
	},
}
