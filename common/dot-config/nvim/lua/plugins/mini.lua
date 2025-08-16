return {
	{
		"echasnovski/mini.nvim",
		dependencies = { { "nvim-treesitter/nvim-treesitter-textobjects" } },
		version = false,
		config = function()
			require("mini.ai").setup({
				custom_textobjects = {
					F = require("mini.ai").gen_spec.treesitter({
						a = "@function.outer",
						i = "@function.inner",
					}),
				},
			})
			require("mini.bracketed").setup()
			require("mini.comment").setup()
			require("mini.icons").setup()
			require("mini.operators").setup()
			require("mini.pairs").setup()
			require("mini.surround").setup({
				mappings = {
					add = "gza", -- Add surrounding in Normal and Visual modes
					delete = "gzd", -- Delete surrounding
					find = "gzf", -- Find surrounding (to the right)
					find_left = "gzF", -- Find surrounding (to the left)
					highlight = "gzh", -- Highlight surrounding
					replace = "gzr", -- Replace surrounding
					update_n_lines = "gzn", -- Update `n_lines`
				},
			})
			require("mini.statusline").setup()
		end,
	},
}
