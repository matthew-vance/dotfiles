return {
	{
		"stevearc/conform.nvim",
		lazy = true,
		event = { "BufReadPre" },
		cmd = "ConformInfo",
		opts = function()
			-- Load language-specific formatters
			local lang_utils = require("utils.lang")
			local lang_formatters = lang_utils.get_formatters()

			-- Base formatters (languages not yet migrated)
			local base_formatters = {
				astro = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				javascript = { "prettierd" },
				json = { "prettierd" },
				sh = { "shfmt" },
				svelte = { "prettierd" },
				typescript = { "prettierd" },
				yaml = { "prettierd" },
			}

			-- Merge with language formatters (language configs take precedence)
			local all_formatters = lang_utils.merge_tables(base_formatters, lang_formatters)

			return {
				default_format_opts = {
					lsp_format = "fallback",
				},
				formatters_by_ft = all_formatters,
				format_on_save = {
					timeout_ms = 500,
				},
			}
		end,
		keys = function()
			return {
				{
					"<leader>fC",
					function()
						require("conform").format()
					end,
					mode = { "n", "v" },
					desc = "Format Code",
				},
			}
		end,
	},
}
