-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{ import = "plugins" },
		{
			"sphamba/smear-cursor.nvim",
			opts = {
				stiffness = 0.8,
				trailing_stiffness = 0.5,
				stiffness_insert_mode = 0.7,
				trailing_stiffness_insert_mode = 0.7,
				damping = 0.8,
				damping_insert_mode = 0.8,
				distance_stop_animating = 0.5,
			},
		},
		{
			"karb94/neoscroll.nvim",
			opts = {},
		},
	},
	install = { colorscheme = { "catppuccin" } },
	checker = { enabled = true },
})
