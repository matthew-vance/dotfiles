require("nvim-treesitter-textobjects").setup({
	move = { set_jumps = true },
})

local move = require("nvim-treesitter-textobjects.move")
local map = vim.keymap.set
local modes = { "n", "x", "o" }

-- stylua: ignore start
map(modes, "]f", function() move.goto_next_start("@function.outer", "textobjects") end,     { desc = "Next function start" })
map(modes, "[f", function() move.goto_previous_start("@function.outer", "textobjects") end, { desc = "Prev function start" })
map(modes, "]F", function() move.goto_next_end("@function.outer", "textobjects") end,       { desc = "Next function end" })
map(modes, "[F", function() move.goto_previous_end("@function.outer", "textobjects") end,   { desc = "Prev function end" })

map(modes, "]c", function() move.goto_next_start("@class.outer", "textobjects") end,        { desc = "Next class start" })
map(modes, "[c", function() move.goto_previous_start("@class.outer", "textobjects") end,    { desc = "Prev class start" })
map(modes, "]C", function() move.goto_next_end("@class.outer", "textobjects") end,          { desc = "Next class end" })
map(modes, "[C", function() move.goto_previous_end("@class.outer", "textobjects") end,      { desc = "Prev class end" })
-- stylua: ignore end
