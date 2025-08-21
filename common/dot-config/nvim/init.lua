vim.loader.enable()

if not vim.g.vscode then
	require("config.options")
	require("config.lazy")
	require("config.keymaps")
	require("config.autocmds")
end
