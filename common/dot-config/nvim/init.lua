-- Setup package manager
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/echasnovski/mini.nvim",
		mini_path,
	}
	vim.fn.system(clone_cmd)
	vim.cmd("packadd mini.nvim | helptags ALL")
	vim.cmd('echo "Installed `mini.nvim`" | redraw')
end
require("mini.deps").setup({ path = { package = path_package } })
local add, now, later, set =
	require("mini.deps").add, require("mini.deps").now, require("mini.deps").later, vim.keymap.set

-- Options
now(function()
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
	vim.opt.inccommand = "nosplit"
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
	vim.opt.undolevels = 10000
	vim.opt.updatetime = 200
	vim.opt.wrap = false
end)

-- Keymaps
later(function()
	set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>write<CR><Esc>", { desc = "Write" })
	set({ "i", "x", "n", "s" }, "<leader>w", "<cmd>write<CR><Esc>", { desc = "Write" })
	set("n", "<leader>qq", "<cmd>quit<CR>", { desc = "Quit" })
	set({ "i", "v" }, "jk", "<Esc>", { desc = "Exit to normal mode" })
	set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
	set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
	set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
	set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
	set("n", "<leader>vs", function()
		vim.cmd.write()
		vim.cmd.source(vim.fn.stdpath("config") .. "/init.lua")
	end, { desc = "Save buffer and source config" })
	set("n", "<esc>", function()
		vim.cmd("nohlsearch")
	end, { desc = "Clear highlights" })
	vim.keymap.set("n", "<leader>ve", function()
		vim.cmd.edit(vim.fn.stdpath("config") .. "/init.lua")
	end, { desc = "Edit init.lua" })
	set("n", "<leader>xq", "<cmd>copen<CR>", { desc = "[Q]uickfix [O]pen" })
	set("n", "<leader>xQ", "<cmd>cclose<CR>", { desc = "[Q]uickfix [C]lose" })
end)

-- Autocmds
now(function()
	vim.api.nvim_create_autocmd("TextYankPost", {
		desc = "Highlight when yanking (copying) text",
		group = vim.api.nvim_create_augroup("user-highlight-yank", { clear = true }),
		callback = function()
			vim.highlight.on_yank()
		end,
	})
end)

now(function()
	add({ source = "catppuccin/nvim", name = "catppuccin" })
	vim.cmd.colorscheme("catppuccin-mocha")
end)

later(function()
	require("mini.bracketed").setup()
	require("mini.comment").setup()
	require("mini.completion").setup()
	require("mini.diff").setup()
	require("mini.icons").setup()
	require("mini.move").setup()
	require("mini.operators").setup()
	require("mini.pairs").setup()
	require("mini.statusline").setup()
	require("mini.surround").setup()
end)

later(function()
	local git = require("mini.git")
	git.setup()

	set("n", "<leader>gs", "<cmd>Git status<CR>", { desc = "[G]it [S]tatus" })
	set("n", "<leader>gd", "<cmd>Git diff<CR>", { desc = "[G]it [D]iff" })
end)

later(function()
	add({ source = "nvim-treesitter/nvim-treesitter-textobjects" })
	local ai = require("mini.ai")
	ai.setup({
		custom_textobjects = {
			F = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
		},
	})
end)

later(function()
	local files = require("mini.files")
	files.setup({
		windows = {
			max_number = 4,
			preview = true,
			width_focus = 40,
			width_nofocus = 20,
			width_preview = 60,
		},
	})

	set("n", "<leader>e", files.open, { desc = "Open [E]xplorer" })
end)

later(function()
	local pick = require("mini.pick")
	local extra = require("mini.extra")
	pick.setup()
	extra.setup()

	-- Standard pickers
	set("n", "<leader>ff", pick.builtin.files, { desc = "[F]ind [F]ile" })
	set("n", "<leader>fg", pick.builtin.grep_live, { desc = "[F]ind [G]rep" })
	set("n", "<leader>fh", pick.builtin.help, { desc = "[F]ind [H]elp" })
	set("n", "<leader>fr", pick.builtin.resume, { desc = "[F]ind [R]esume" })
	set("n", "<leader>fb", pick.builtin.buffers, { desc = "[F]ind [B]uffer" })

	-- Extra pickers
	set("n", "<leader>ft", extra.pickers.colorschemes, { desc = "[F]ind [T]heme" })
	set("n", "<leader>fo", extra.pickers.oldfiles, { desc = "[F]ind [O]ld file" })
	set("n", "<leader>fd", extra.pickers.diagnostic, { desc = "[F]ind [D]iagnostic" })
	set("n", "<leader>fk", extra.pickers.keymaps, { desc = "[F]ind [K]eymaps" })
	set("n", "<leader>fj", function()
		extra.pickers.list({ scope = "jump" })
	end, { desc = "[F]ind [J]umps" })
	set("n", "<leader>fq", function()
		extra.pickers.list({ scope = "quickfix" })
	end, { desc = "[F]ind in [Q]uickfix list" })
	set("n", "<leader>fsd", function()
		extra.pickers.lsp({ scope = "document_symbol" })
	end, { desc = "[F]ind [S]ymbols in [D]ocument" })
	set("n", "<leader>fsw", function()
		extra.pickers.lsp({ scope = "workspace_symbol" })
	end, { desc = "[F]ind [S]ymbols in [W]orkspace" })
	set("n", "<leader>bd", require("mini.bufremove").delete, { desc = "[B]uffer [D]elete" })

	set("n", "grr", function()
		extra.pickers.lsp({ scope = "references" })
	end, { desc = "[G]oto [R]eferences" })
end)

later(function()
	add({ source = "lukas-reineke/indent-blankline.nvim" })

	local ibl = require("ibl")
	ibl.setup()
end)

later(function()
	add({ source = "rafamadriz/friendly-snippets" })
	local gen_loader = require("mini.snippets").gen_loader
	require("mini.snippets").setup({
		snippets = {
			gen_loader.from_lang(),
		},
	})
end)

-- LSP
later(function()
	add({ source = "neovim/nvim-lspconfig" })

	local lsps = {
		gols = {},
		lua_ls = {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
				},
			},
		},
		ts_ls = {},
	}

	for lsp, config in pairs(lsps) do
		vim.lsp.config(lsp, config)
		vim.lsp.enable(lsp)
	end
end)

-- Formatting
later(function()
	add({ source = "stevearc/conform.nvim" })

	local conform = require("conform")
	conform.setup({
		default_format_opts = {
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			javascript = { "prettier" },
			lua = { "stylua" },
			typescript = { "prettier" },
		},
		format_on_save = {},
	})

	set("n", "<leader>c", conform.format, { desc = "Format [C]ode" })
end)

now(function()
	add({
		source = "nvim-treesitter/nvim-treesitter",
		checkout = "master",
		monitor = "master",
		hooks = {
			post_checkout = function()
				vim.cmd("TSUpdate")
			end,
		},
	})

	require("nvim-treesitter.configs").setup({
		ensure_installed = { "go", "json", "javascript", "lua", "markdown", "toml", "typescript" },
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn",
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
		indent = { enable = true },
	})
end)

later(function()
	add({
		source = "zbirenbaum/copilot.lua",
	})

	require("copilot").setup({
		suggestion = {
			auto_trigger = true,
			hide_during_completion = false,
			keymap = {
				accept = "<Tab>",
			},
		},
	})
end)
