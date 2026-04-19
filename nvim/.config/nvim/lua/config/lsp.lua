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

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client or client.name ~= "eslint" then return end

    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = args.buf,
      callback = function()
        vim.lsp.buf.code_action({
          context = { only = { "source.fixAll.eslint" }, diagnostics = {} },
          apply = true,
        })
      end,
    })
  end,
})
