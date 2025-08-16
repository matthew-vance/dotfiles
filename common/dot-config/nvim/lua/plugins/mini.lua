return {
	{
		"echasnovski/mini.nvim",
		dependencies = { { "nvim-treesitter/nvim-treesitter-textobjects" }, { "rafamadriz/friendly-snippets" } },
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
			local gen_loader = require("mini.snippets").gen_loader
			require("mini.snippets").setup({
				snippets = {
					gen_loader.from_lang(),
				},
			})
			require("mini.statusline").setup()
		end,
	},
}
