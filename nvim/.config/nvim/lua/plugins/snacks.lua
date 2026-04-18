require("snacks").setup({
  bigfile = {},
  indent = {},
  picker = {},
  quickfile = {},
})

local map = vim.keymap.set
map("n", "<leader><space>", function() Snacks.picker.smart() end,           { desc = "Smart find files" })
map("n", "<leader>ff",      function() Snacks.picker.files() end,           { desc = "Find files" })
map("n", "<leader>/",       function() Snacks.picker.grep() end,            { desc = "Grep" })
map("n", "<leader>,",       function() Snacks.picker.buffers() end,         { desc = "Buffers" })
map("n", "<leader>:",       function() Snacks.picker.command_history() end, { desc = "Command history" })
map("n", "<leader>sh",      function() Snacks.picker.help() end,            { desc = "Help pages" })
map("n", "<leader>sk",      function() Snacks.picker.keymaps() end,         { desc = "Keymaps" })
