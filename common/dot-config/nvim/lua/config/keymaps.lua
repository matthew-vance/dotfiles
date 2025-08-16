local map = vim.keymap.set

-- stylua: ignore start
map("n", "<space>", "<Nop>")
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>write<CR><Esc>", { desc = "Write" })
map({ "i", "x", "n", "s" }, "<leader>w", "<cmd>write<CR><Esc>", { desc = "Write" })
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<CR>", { desc = "Switch to Other Buffer" })
map("n", "<leader>qq", "<cmd>quit<CR>", { desc = "Quit" })
map({ "i", "v" }, "kj", "<Esc>", { desc = "Exit to normal mode" })
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- stylua: ignore end
