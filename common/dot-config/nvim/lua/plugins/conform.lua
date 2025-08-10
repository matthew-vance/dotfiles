return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				go = { "gofumpt", "goimports" },
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				json = { "jq" },
				lua = { "stylua" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			format_on_save = {
				timeout_ms = 500,
			},
		},
		keys = function()
			local conform = require("conform")
			return {
				{
					"<leader>cf",
					function()
						conform.format({ async = true })
					end,
					desc = "Format File",
				},
			}
		end,
	},
}
