local ai = require("mini.ai")
ai.setup({
	custom_textobjects = {
		F = ai.gen_spec.treesitter({ a = "@function.outer",    i = "@function.inner" }),
		C = ai.gen_spec.treesitter({ a = "@class.outer",       i = "@class.inner" }),
		o = ai.gen_spec.treesitter({ a = "@conditional.outer", i = "@conditional.inner" }),
		l = ai.gen_spec.treesitter({ a = "@loop.outer",        i = "@loop.inner" }),
	},
})

require("mini.comment").setup()
require("mini.diff").setup({
	view = {
		style = "sign",
		signs = { add = "▎", change = "▎", delete = "" },
	},
})
require("mini.cursorword").setup()
require("mini.icons").setup()
require("mini.pairs").setup()
require("mini.starter").setup()
require("mini.statusline").setup()
