vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- LSP attach optimizations
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP buffer mappings and settings",
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local bufnr = event.buf
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		-- Enable inlay hints if supported
		if client and client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end
	end,
})
