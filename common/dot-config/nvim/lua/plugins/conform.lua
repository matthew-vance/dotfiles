return {
  {
    "stevearc/conform.nvim",
    event = { "VeryLazy" },
    opts = {
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        lua = { "stylua" },
        typescript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format()
        end,
        mode = { "n", "v" },
        desc = "Format code",
      },
    },
  },
}
