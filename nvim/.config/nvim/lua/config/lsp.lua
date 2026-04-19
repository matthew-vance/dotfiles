vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.enable({ "lua_ls", "gopls", "vtsls", "eslint" })

vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  float = { border = "rounded", source = true },
})

local augroup = vim.api.nvim_create_augroup("LspConfig", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  callback = function(args)
    if not vim.lsp.get_clients({ bufnr = args.buf, name = "eslint" })[1] then return end
    vim.lsp.buf.code_action({
      context = { only = { "source.fixAll.eslint" }, diagnostics = {} },
      apply = true,
    })
  end,
})
