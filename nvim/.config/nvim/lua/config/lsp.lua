vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.enable({
	"lua_ls",
	"gopls",
	"vtsls",
	"eslint",
	"basedpyright",
	"ruff",
	"bashls",
	"just",
	"jsonls",
	"yamlls",
	"dockerls",
	"taplo",
	"terraformls",
	"ansiblels",
	"rust_analyzer",
	"svelte",
	"html",
	"cssls",
	"emmet_language_server",
	"tailwindcss",
})

vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config({
	virtual_text = true,
	severity_sort = true,
	float = { border = "rounded", source = true },
})
