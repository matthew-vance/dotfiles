vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.config("eslint", {
	root_markers = {
		"eslint.config.js",
		"eslint.config.mjs",
		"eslint.config.cjs",
		"eslint.config.ts",
		".eslintrc",
		".eslintrc.js",
		".eslintrc.cjs",
		".eslintrc.json",
		".eslintrc.yaml",
		".eslintrc.yml",
	},
	workspace_required = true,
})

vim.lsp.config("oxlint", {
	root_markers = {
		".oxlintrc.json",
		".oxlintrc.jsonc",
		"oxlint.config.ts",
	},
	workspace_required = true,
})

vim.lsp.enable({
	"lua_ls",
	"gopls",
	"vtsls",
	"eslint",
	"oxlint",
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
