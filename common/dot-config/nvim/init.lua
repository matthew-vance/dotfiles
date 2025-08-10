vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

map({ "n", "v" }, "<space>", "<nop>", { silent = true })
map("n", "<leader>w", ":write<CR>", { desc = "Save" })
map("n", "<leader>q", ":quit<CR>", { desc = "Quit" })
map("n", "<esc>", function()
	vim.cmd("nohlsearch")
end, { desc = "Clear highlights" })
map({ "i", "v" }, "jk", "<Esc>", { desc = "Go to normal mode" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to window right" })
map("n", "<C-h>", "<C-w>h", { desc = "Move to window left" })
-- Close current buffer, go to last-used one
map("n", "<leader>bd", function()
	local alt = vim.fn.bufnr("#")
	if alt > 0 and vim.fn.buflisted(alt) == 1 then
		vim.cmd("buffer #")
	end
	vim.cmd("bdelete #")
end, { desc = "Close buffer and switch" })

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 200
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.winborder = "rounded"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.confirm = true
vim.opt.colorcolumn = "80,100,120"
vim.opt.autoread = true
vim.opt.scrolloff = 10
vim.opt.cursorline = true

require("config.lazy")
