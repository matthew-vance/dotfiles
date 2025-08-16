-- Options
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.autoread = true
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "80,100,120"
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.mouse = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 2
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.updatetime = 200
vim.opt.winborder = "rounded"
vim.opt.wrap = false

-- Plugins
require("config.lazy")

-- Keymaps
local map = vim.keymap.set

-- stylua: ignore start
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>write<CR><Esc>", { desc = "Write" })
map({ "i", "x", "n", "s" }, "<leader>w", "<cmd>write<CR><Esc>", { desc = "Write" })
map("n", "<leader>qq", "<cmd>quit<CR>", { desc = "Quit" })
map({ "i", "v" }, "kj", "<Esc>", { desc = "Exit to normal mode" })
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
map("n", "<esc>", function() vim.cmd("nohlsearch") end, { desc = "Clear highlights" })
-- stylua: ignore end

-- Autocmds
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("user-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
