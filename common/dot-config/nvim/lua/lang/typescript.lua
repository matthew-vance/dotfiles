return {
	-- LSP server configurations (keys are the server names to install)
	lsp = {
		ts_ls = {},
		["eslint-lsp"] = {},
	},

	-- Treesitter parsers for TypeScript and JavaScript
	treesitter = {
		"javascript",
		"typescript",
		"tsx",
	},

	-- Formatters for TypeScript and JavaScript files
	formatters = {
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescriptreact = { "prettierd" },
	},
}
