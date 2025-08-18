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
			local lang_utils = require("utils.lang")
			local lang_servers = lang_utils.get_lsp_servers()

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

			local all_servers = lang_utils.merge_arrays_unique(base_servers, lang_servers)

			-- Extract formatters from language configs
			local lang_formatter_tools = lang_utils.get_all_formatter_tools()

			-- Base formatters (extract tools from base formatter configs)
			local base_formatters = {
				astro = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				sh = { "shfmt" },
				svelte = { "prettierd" },
				yaml = { "prettierd" },
			}

			local base_formatter_tools = {}
			local seen_formatters = {}
			for _, formatter_list in pairs(base_formatters) do
				for _, item in ipairs(formatter_list) do
					if type(item) == "string" and not seen_formatters[item] then
						table.insert(base_formatter_tools, item)
						seen_formatters[item] = true
					end
				end
			end

			-- Combine all formatter tools (with deduplication)
			local all_formatter_tools = lang_utils.merge_arrays_unique(base_formatter_tools, lang_formatter_tools)

			-- Additional tools (linters, etc.)
			local additional_tools = {
				"markdownlint",
				"yamllint",
			}

			return {
				ensure_installed = vim.list_extend(vim.list_extend(all_servers, all_formatter_tools), additional_tools),
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

			local lang_utils = require("utils.lang")
			local lang_configs = lang_utils.get_lsp_configs()

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
