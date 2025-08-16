return {
	{
		"stevearc/conform.nvim",
		lazy = true,
		event = { "BufReadPre" },
		cmd = "ConformInfo",
		opts = {
			default_format_opts = {
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				lua = { "stylua" },
			},
			format_on_save = {
				timeout_ms = 500,
			},
		},
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
