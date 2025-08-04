local s = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

s({ "n", "v" }, "<space>", "<nop>", { silent = true })

s("i", "jk", "<esc>", { desc = "Go to Normal mode" })

s("n", "<C-j>", "<C-w>j")
s("n", "<C-k>", "<C-w>k")
s("n", "<C-l>", "<C-w>l")
s("n", "<C-h>", "<C-w>h")
