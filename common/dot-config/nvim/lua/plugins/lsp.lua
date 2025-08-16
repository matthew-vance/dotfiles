return {
	{
		"Saghen/blink.cmp",
		version = "1.*",
		dependencies = { "mini.nvim" },
		event = "InsertEnter",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "default" },
			snippets = { preset = "mini_snippets" },
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
				"astro",
				"bashls",
				"cssls",
				"dockerls",
				"docker_compose_language_service",
				"eslint-lsp",
				"gopls",
				"html",
				"jsonls",
				"lua_ls",
				"marksman",
				"svelte",
				"tailwindcss",
				"terraform",
				"ts_ls",
				"yamlls",
				-- Formatters / linters / extras
				"markdownlint",
				"prettierd",
				"shfmt",
				"stylua",
				"yamllint",
			},
			auto_update = false,
			run_on_start = true,
			start_delay = 2000,
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
			vim.diagnostic.config({
				virtual_text = { prefix = "●" },
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			local servers = {
				astro = {},
				bashls = {},
				cssls = {},
				dockerls = {},
				docker_compose_language_service = {},
				["eslint-lsp"] = {},
				gopls = {
					gofumpt = true,
				},
				html = {},
				jsonls = {},
				lua_ls = {
					settings = {
						Lua = {
							telemetry = { enable = false },
						},
					},
				},
				marksman = {},
				svelte = {},
				tailwindcss = {},
				terraform = {},
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
				{ "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action" },
			}
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		lazy = true,
	},
}
