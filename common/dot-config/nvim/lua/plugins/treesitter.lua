return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = function()
			local lang_utils = require("utils.lang")
			local lang_parsers = lang_utils.get_treesitter_parsers()

			local base_parsers = {
				"astro",
				"bash",
				"c",
				"css",
				"diff",
				"dockerfile",
				"gitignore",
				"hcl",
				"html",
				"json",
				"jsonc",
				"just",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"sql",
				"svelte",
				"terraform",
				"vim",
				"vimdoc",
			}

			local all_parsers = lang_utils.merge_arrays_unique(base_parsers, lang_parsers)

			return {
				ensure_installed = all_parsers,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn",
						node_incremental = "grn",
						scope_incremental = "grc",
						node_decremental = "grm",
					},
				},
				indent = { enable = true },
				modules = {},
				sync_install = false,
				ignore_install = {},
			}
		end,
	},
}
