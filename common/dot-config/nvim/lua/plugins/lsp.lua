local function concat_tables(...)
	local result = {}
	for i = 1, select("#", ...) do
		local t = select(i, ...)
		for _, v in ipairs(t) do
			table.insert(result, v)
		end
	end
	return result
end

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"saghen/blink.cmp",
			"ibhagwan/fzf-lua",
		},
		opts = {
			servers = {
				"bashls",
				"docker_compose_language_service",
				"dockerls",
				"eslint",
				"golangci_lint_ls",
				"jsonls",
				"just",
				"lua_ls",
				"gopls",
				"terraformls",
				"ts_ls",
			},
			linters = { "eslint_d" },
			formatters = { "gofumpt", "goimports", "jq", "prettierd", "shfmt", "stylua" },
		},
		config = function(_, opts)
			require("mason").setup()
			require("mason-lspconfig").setup()

			local ensure_installed = concat_tables(opts.servers, opts.formatters, opts.linters)

			require("mason-tool-installer").setup({
				ensure_installed = ensure_installed,
				auto_update = true,
				run_on_start = true,
			})

			for _, server in pairs(opts.servers) do
				vim.lsp.enable(server)
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					local fzf = require("fzf-lua")
					map("<leader>rn", vim.lsp.buf.rename, "Rename")
					map("<leader>ca", vim.lsp.buf.code_action, "Code action", { "n", "x" })
					map("gr", fzf.lsp_references, "List References")
					map("gd", fzf.lsp_definitions, "Go to Definition")
					map("gD", fzf.lsp_declarations, "Go to Declaration")
					map("gt", fzf.lsp_typedefs, "Go to Type Definition")
					map("gi", fzf.lsp_implementations, "Go to Implementation")
					map("K", vim.lsp.buf.hover, "Hover Documentation")
					map("<C-k>", vim.lsp.buf.signature_help, "Signature Help")
					map("<leader>sd", fzf.lsp_document_symbols, "Document Symbols")
					map("<leader>sw", fzf.lsp_workspace_symbols, "Workspace Symbols")
					map("<leader>dd", fzf.diagnostics_document, "Document Diagnostics")
					map("<leader>dw", fzf.diagnostics_workspace, "Workspace Diagnostics")
				end,
			})
		end,
	},
}
