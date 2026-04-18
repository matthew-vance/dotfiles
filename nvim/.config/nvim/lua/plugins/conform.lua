require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})

local map = vim.keymap.set
-- stylua: ignore
map("n", "<leader>cf", function() require("conform").format({ async = true }) end, { desc = "Format buffer" })
