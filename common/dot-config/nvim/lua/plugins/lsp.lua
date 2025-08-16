return {
	{
		"Saghen/blink.cmp",
		version = "1.*",
		dependencies = { "rafamadriz/friendly-snippets" },
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "default" },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			signature = { enabled = true },
		},
		opts_extend = { "sources.default" },
	},
	{
		"mason-org/mason.nvim",
		build = ":MasonUpdate",
		cmd = { "Mason", "MasonInstall", "MasonUpdate" },
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim", "mason-org/mason-lspconfig.nvim" },
		event = "VeryLazy",
		opts = {
			ensure_installed = {
				"bashls",
				"cssls",
				"eslint-lsp",
				"gopls",
				"html",
				"jsonls",
				"lua_ls",
				"ts_ls",
				"yamlls",
				-- Formatters / linters / extras
				"prettierd",
				"shfmt",
				"stylua",
			},
			auto_update = false,
			run_on_start = true,
			start_delay = 2000,
			debounce_hours = 6,
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			"Saghen/blink.cmp",
		},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local servers = {
				["eslint-lsp"] = {},
				gopls = {},
				html = {},
				jsonls = {},
				lua_ls = {
					settings = {
						Lua = {},
					},
				},
				ts_ls = {},
				yamlls = {},
			}

			for server, config in pairs(servers) do
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end
		end,
		keys = function()
			return {
				{ "<leader>r", vim.lsp.buf.rename, desc = "Rename" },
			}
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		lazy = true,
	},
}
