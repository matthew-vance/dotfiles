return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {},
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason-lspconfig.nvim" },
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    },
    init = function()
      -- Reserve a space in the gutter
      -- This will avoid an annoying layout shift in the screen
      vim.opt.signcolumn = "yes"
    end,
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "bashls",
          "gofumpt",
          "goimports",
          "gopls",
          "lua_ls",
          "luaformatter",
          "prettier",
          "prettierd",
          "shfmt",
          "stylua",
          "ts_ls",
        },
        auto_update = true,
      })

      local lsp_defaults = require("lspconfig").util.default_config

      -- Add cmp_nvim_lsp capabilities settings to lspconfig
      -- This should be executed before you configure any language server
      lsp_defaults.capabilities = vim.tbl_deep_extend(
        "force",
        lsp_defaults.capabilities,
        require("cmp_nvim_lsp").default_capabilities()
      )

      -- LspAttach is where you enable features that only work
      -- if there is a language server active in the file
      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
          vim.keymap.set(
            "n",
            "gd",
            "<cmd>lua vim.lsp.buf.definition()<cr>",
            opts
          )
          vim.keymap.set(
            "n",
            "gD",
            "<cmd>lua vim.lsp.buf.declaration()<cr>",
            opts
          )
          vim.keymap.set(
            "n",
            "gi",
            "<cmd>lua vim.lsp.buf.implementation()<cr>",
            opts
          )
          vim.keymap.set(
            "n",
            "go",
            "<cmd>lua vim.lsp.buf.type_definition()<cr>",
            opts
          )
          vim.keymap.set(
            "n",
            "gr",
            "<cmd>lua vim.lsp.buf.references()<cr>",
            opts
          )
          vim.keymap.set(
            "n",
            "gs",
            "<cmd>lua vim.lsp.buf.signature_help()<cr>",
            opts
          )
          vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
          vim.keymap.set(
            { "n", "x" },
            "<F3>",
            "<cmd>lua vim.lsp.buf.format({async = true})<cr>",
            opts
          )
          vim.keymap.set(
            "n",
            "<F4>",
            "<cmd>lua vim.lsp.buf.code_action()<cr>",
            opts
          )
        end,
      })

      require("mason-lspconfig").setup({
        handlers = {
          -- this first function is the "default handler"
          -- it applies to every language server without a "custom handler"
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,
          lua_ls = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
              capabilities = lsp_defaults.capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" },
                  },
                },
              },
            })
          end,
        },
      })
    end,
  },
}
