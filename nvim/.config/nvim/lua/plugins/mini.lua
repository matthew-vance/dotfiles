require("mini.comment").setup()
require("mini.completion").setup()
require("mini.cursorword").setup()
require("mini.icons").setup()
require("mini.pairs").setup()
require("mini.starter").setup()
require("mini.statusline").setup()

local map = vim.keymap.set
-- stylua: ignore
map("i", "<C-Space>", function() MiniCompletion.complete_twostep() end, { desc = "Trigger completion" })
