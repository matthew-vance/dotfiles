return {
	-- LSP server configurations (keys are the server names to install)
	lsp = {
		gopls = {
			settings = {
				gopls = {
					gofumpt = true,
				},
			},
		},
	},

	-- Treesitter parsers for Go
	treesitter = {
		"go",
		"gomod",
		"gosum",
	},

	-- Formatters for Go files (gopls handles formatting by default)
	formatters = {},
}
