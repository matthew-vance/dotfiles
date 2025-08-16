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
				astro = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				javascript = { "prettierd" },
				json = { "prettierd" },
				lua = { "stylua" },
				sh = { "shfmt" },
				svelte = { "prettierd" },
				typescript = { "prettierd" },
				yaml = { "prettierd" },
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
