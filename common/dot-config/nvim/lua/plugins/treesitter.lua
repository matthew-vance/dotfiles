return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"bash",
					"dockerfile",
					"go",
					"gomod",
					"gosum",
					"gowork",
					"hcl",
					"javascript",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"terraform",
					"typescript",
					"tsx",
					"vim",
					"vimdoc",
					"yaml",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				auto_install = true,
				ignore_install = {},
				modules = {},
			})
		end,
	},
}
