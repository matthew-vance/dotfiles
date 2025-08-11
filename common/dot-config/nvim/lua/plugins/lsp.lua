return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "saghen/blink.cmp",
    "ibhagwan/fzf-lua",
  },
  opts = {
    servers = {
      lua_ls = {},
      ts_ls = {},
    },
    ensure_installed = {
      "eslint-lsp",
      "lua-language-server",
      "prettier",
      "prettierd",
      "stylua",
      "typescript-language-server",
    },
  },
  config = function(_, opts)
    local lspconfig = require("lspconfig")
    require("mason-tool-installer").setup({
      ensure_installed = opts.ensure_installed,
    })
    for server, config in pairs(opts.servers) do
      config.capabilities =
        require("blink.cmp").get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
  end,
  keys = function()
    local fzf = require("fzf-lua")
    return {
      {
        "<leader>rn",
        vim.lsp.buf.rename,
        desc = "[R]e[n]ame",
      },
      {
        "<leader>ca",
        fzf.lsp_code_actions,
        desc = "[C]ode [A]ction",
        mode = { "n", "x" },
      },
      {
        "gr",
        fzf.lsp_references,
        desc = "[G]oto [R]eferences",
      },
      {
        "gd",
        fzf.lsp_definitions,
        desc = "[G]oto [D]efinition",
      },
      {
        "<leader>q",
        fzf.diagnostics_document,
        desc = "[D]ocument diagnostics",
      },
      {
        "gi",
        fzf.lsp_implementations,
        desc = "[G]oto [I]mplementation",
      },
      {
        "gt",
        fzf.lsp_typedefs,
        desc = "[G]oto [T]ype definition",
      },
      {
        "gO",
        fzf.lsp_document_symbols,
        desc = "[O]pen document symbols",
      },
      {
        "gW",
        fzf.lsp_live_workspace_symbols,
        desc = "[W]orkspace symbols",
      },
      {
        "K",
        vim.lsp.buf.hover,
      },
      {
        "<C-k>",
        vim.lsp.buf.signature_help,
      },
    }
  end,
}
