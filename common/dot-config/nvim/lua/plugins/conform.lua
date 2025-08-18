return {
	{
		"stevearc/conform.nvim",
		lazy = true,
		event = { "BufReadPre" },
		cmd = "ConformInfo",
		opts = function()
			local lang_utils = require("utils.lang")
			local lang_formatters = lang_utils.get_formatters()
			local base_formatters = lang_utils.get_base_formatters()

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
