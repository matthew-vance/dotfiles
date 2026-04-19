local map = vim.keymap.set

map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
map({ "i", "v" }, "kj", "<Esc>", { desc = "Exit to normal mode" })
map({ "n", "i", "v" }, "<C-s>", "<cmd>write<cr>", { desc = "Save file" })

map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlights" })

map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics" })
map("n", "<leader>D", function() Snacks.picker.diagnostics() end, { desc = "Search diagnostics" })
map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Next diagnostic" })
map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Prev diagnostic" })

map("n", "grn", vim.lsp.buf.rename, { desc = "LSP rename" })
map("n", "gra", vim.lsp.buf.code_action, { desc = "LSP code action" })
map("n", "grr", function() Snacks.picker.lsp_references() end, { desc = "LSP references" })
map("n", "gri", function() Snacks.picker.lsp_implementations() end, { desc = "LSP implementations" })

map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to down split" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to up split" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
