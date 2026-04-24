require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports" },
    javascript = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
    javascriptreact = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
    typescript = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
    json = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
    jsonc = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
    css = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
    html = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
    svelte = { "prettierd", "prettier", stop_after_first = true },
    markdown = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
    yaml = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
    rust = { "rustfmt", lsp_format = "fallback" },
    python = { "ruff_format", "ruff_organize_imports" },
  },
  format_on_save = {
    timeout_ms = 1000,
    lsp_format = "fallback",
  },
})

local map = vim.keymap.set
-- stylua: ignore
map("n", "<leader>cf", function() require("conform").format({ async = true }) end, { desc = "Format buffer" })
