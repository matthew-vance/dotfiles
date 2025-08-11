local s = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

s({ "n", "v" }, "<space>", "<nop>", { silent = true })

s("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
s("i", "jk", "<esc>", { desc = "Go to Normal mode" })

s("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
s("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
s("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
s("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Disable arrow keys in Normal mode
s("n", "<left>", "<cmd>echo 'Use h to move!!'<CR>")
s("n", "<right>", "<cmd>echo 'Use l to move!!'<CR>")
s("n", "<up>", "<cmd>echo 'Use k to move!!'<CR>")
s("n", "<down>", "<cmd>echo 'Use j to move!!'<CR>")
