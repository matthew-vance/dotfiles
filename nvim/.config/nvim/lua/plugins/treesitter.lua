local parsers = {
	"bash",
	"css",
	"diff",
	"dockerfile",
	"gitcommit",
	"go",
	"gomod",
	"gosum",
	"hcl",
	"html",
	"javascript",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"query",
	"regex",
	"terraform",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
}

require("nvim-treesitter").setup()
require("nvim-treesitter").install(parsers)

local group = vim.api.nvim_create_augroup("Treesitter", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = group,
	callback = function(ev)
		local lang = vim.treesitter.language.get_lang(ev.match)
		if not (lang and pcall(vim.treesitter.language.add, lang)) then
			return
		end

		pcall(vim.treesitter.start, ev.buf, lang)

		vim.wo.foldmethod = "expr"
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

-- Re-run :TSUpdate when vim.pack installs or updates nvim-treesitter.
vim.api.nvim_create_autocmd("PackChanged", {
	group = group,
	callback = function(ev)
		local spec = ev.data and ev.data.spec
		if not spec or spec.name ~= "nvim-treesitter" then
			return
		end
		if ev.data.kind == "install" or ev.data.kind == "update" then
			vim.cmd("TSUpdate")
		end
	end,
})
