return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = function()
			-- Load language-specific parsers
			local lang_utils = require("utils.lang")
			local lang_parsers = lang_utils.get_treesitter_parsers()

			-- Base parsers (languages not yet migrated)
			local base_parsers = {
				"astro",
				"bash",
				"c",
				"css",
				"diff",
				"dockerfile",
				"gitignore",
				"go",
				"gomod",
				"gosum",
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

			-- Merge with language parsers
			local all_parsers = lang_utils.merge_arrays(base_parsers, lang_parsers)

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
