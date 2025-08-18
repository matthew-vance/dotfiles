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
		opts = function()
			-- Load language-specific servers
			local lang_utils = require("utils.lang")
			local lang_servers = lang_utils.get_lsp_servers()

			-- Base servers (languages not yet migrated)
			local base_servers = {
				"astro",
				"bashls",
				"cssls",
				"dockerls",
				"docker_compose_language_service",
				"html",
				"jsonls",
				"marksman",
				"svelte",
				"tailwindcss",
				"terraform",
				"yamlls",
			}

			-- Merge with language servers
			local all_servers = lang_utils.merge_arrays(base_servers, lang_servers)

			return {
				ensure_installed = vim.list_extend(all_servers, {
					-- Formatters / linters / extras
					"markdownlint",
					"prettierd",
					"shfmt",
					"stylua",
					"yamllint",
				}),
				auto_update = false,
				run_on_start = true,
				start_delay = 2000,
			}
		end,
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

			-- Load language-specific configs
			local lang_utils = require("utils.lang")
			local lang_configs = lang_utils.get_lsp_configs()

			-- Define base servers (languages not yet migrated to lang/ files)
			local base_servers = {
				astro = {},
				bashls = {},
				cssls = {},
				dockerls = {},
				docker_compose_language_service = {},
				html = {},
				jsonls = {},
				marksman = {},
				svelte = {},
				tailwindcss = {},
				terraform = {},
				yamlls = {},
			}

			-- Merge language configs with base servers (language configs take precedence)
			local servers = lang_utils.merge_tables(base_servers, lang_configs)

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
