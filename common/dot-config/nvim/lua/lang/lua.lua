return {
	-- LSP server configurations (keys are the server names to install)
	lsp = {
		lua_ls = {
			settings = {
				Lua = {
					telemetry = { enable = false },
				},
			},
		},
	},

	-- Treesitter parsers for Lua
	treesitter = {
		"lua",
		"luadoc",
	},

	-- Formatters for Lua files
	formatters = {
		lua = { "stylua" },
	},
}

