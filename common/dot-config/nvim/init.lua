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

-- require("lazy").setup({
-- 	{ import = "plugins" },
-- 	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
-- 	{ "echasnovski/mini.nvim", version = false },
-- 	"ibhagwan/fzf-lua",
-- 	{
-- 		"saghen/blink.cmp",
-- 		dependencies = { "rafamadriz/friendly-snippets" },
-- 		version = "1.*",
-- 		---@module 'blink.cmp'
-- 		---@type blink.cmp.Config
-- 		opts = {
-- 			keymap = { preset = "super-tab" },
-- 			appearance = {
-- 				nerd_font_variant = "mono",
-- 			},
-- 			completion = { documentation = { auto_show = false } },
-- 			sources = {
-- 				default = { "lsp", "path", "snippets", "buffer" },
-- 			},
-- 			fuzzy = { implementation = "prefer_rust_with_warning" },
-- 		},
-- 		opts_extend = { "sources.default" },
-- 	},
-- 	"neovim/nvim-lspconfig",
-- 	"williamboman/mason.nvim",
-- 	"williamboman/mason-lspconfig.nvim",
-- 	"WhoIsSethDaniel/mason-tool-installer.nvim",
-- 	"stevearc/conform.nvim",
-- }, {
-- 	checker = {
-- 		enabled = true,
-- 		notify = false,
-- 	},
-- 	change_detection = {
-- 		notify = false,
-- 	},
-- })

-- require("nvim-treesitter.configs").setup({
-- 	ensure_installed = {
-- 		"lua",
-- 		"vim",
-- 		"vimdoc",
-- 		"javascript",
-- 		"typescript",
-- 		"tsx",
-- 		"go",
-- 		"gomod",
-- 		"gosum",
-- 		"json",
-- 		"yaml",
-- 		"bash",
-- 		"markdown",
-- 		"markdown_inline",
-- 	},
-- 	highlight = { enable = true },
-- 	indent = { enable = true },
-- 	auto_install = true,
-- 	sync_install = false,
-- 	ignore_install = {},
-- 	modules = {},
-- })

-- require("mason").setup()
-- require("mason-tool-installer").setup({
-- 	ensure_installed = {
-- 		"bashls",
-- 		"jq",
-- 		"just",
-- 		"lua_ls",
-- 		"prettierd",
-- 		"stylua",
-- 		"ts_ls",
-- 	},
-- 	auto_update = true,
-- 	run_on_start = true,
-- })

-- local lspconfig = require("lspconfig")

-- lspconfig.bashls.setup({})
-- lspconfig.lua_ls.setup({})
-- lspconfig.ts_ls.setup({})

-- require("conform").setup({
-- 	formatters_by_ft = {
-- 		javascript = { "prettierd" },
-- 		json = { "jq" },
-- 		just = { "just" },
-- 		lua = { "stylua" },
-- 		typescript = { "prettierd" },
-- 	},
-- 	format_on_save = {
-- 		timeout_ms = 500,
-- 		lsp_format = "fallback",
-- 	},
-- })

-- require("mini.ai").setup()
-- require("mini.bracketed").setup()
-- require("mini.comment").setup()
-- require("mini.extra").setup()
-- require("mini.files").setup()
-- require("mini.icons").setup()
-- require("mini.jump").setup({
-- 	delay = {
-- 		idle_stop = 5000,
-- 	},
-- })
-- require("mini.statusline").setup()
-- require("mini.surround").setup()

-- require("fzf-lua").register_ui_select()

-- local map = vim.keymap.set
-- map("n", "<leader>ff", ":FzfLua files<CR>", { desc = "Find files" })
-- map("n", "<leader>fr", ":FzfLua resume<CR>", { desc = "Resume last find" })
-- map("n", "<leader>fo", ":FzfLua oldfiles<CR>", { desc = "Find old files" })
-- map("n", "<leader>fb", ":FzfLua buffers<CR>", { desc = "Find buffers" })
-- map("n", "<leader>fg", ":FzfLua live_grep_native<CR>", { desc = "Find grep" })
-- map("n", "<leader>fw", ":FzfLua grep_cword<CR>", { desc = "Find grep word under cusor" })
-- map("n", "<leader>fh", ":FzfLua helptags<CR>", { desc = "Find help" })
-- map("n", "<leader>fd", ":FzfLua diagnostics_document<CR>", { desc = "Find diagnostics in document" })
-- map("n", "<leader>fs", ":FzfLua lsp_document_symbols<CR>", { desc = "Find symbol in document" })
-- map("n", "gr", ":FzfLua lsp_references<CR>", { desc = "Goto references" })
-- map("n", "gd", ":FzfLua lsp_definitions<CR>", { desc = "Goto definition" })
-- map("n", "<leader>ca", ":FzfLua lsp_code_actions<CR>", { desc = "Code actions" })
-- map("n", "<leader>w", ":write<CR>", { desc = "Save" })
-- map("n", "<leader>q", ":quit<CR>", { desc = "Quit" })
-- map("n", "<leader>e", MiniFiles.open, { desc = "Open file explorer" })
-- map("n", "<leader>f", require("conform").format, { desc = "Format code" })
-- map({ "i", "v" }, "jk", "<Esc>", { desc = "Exit to normal mode" })
-- map("n", "<C-j>", "<C-w>j")
-- map("n", "<C-k>", "<C-w>k")
-- map("n", "<C-l>", "<C-w>l")
-- map("n", "<C-h>", "<C-w>h")

-- local clear_search_highlights = function()
-- 	if vim.v.hlsearch == 1 then
-- 		vim.cmd("noh")
-- 	end
-- end
-- local jump_stop = function()
-- 	if not MiniJump.state.jumping then
-- 		return "<Esc>"
-- 	end
-- 	MiniJump.stop_jumping()
-- end
-- local clean_highlights = function()
-- 	clear_search_highlights()
-- 	jump_stop()
-- end
-- map("n", "<esc>", clean_highlights, { desc = "Clear highlights" })
