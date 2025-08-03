return {
  {
    "echasnovski/mini.nvim",
    event = { "VeryLazy" },
    config = function()
      require("mini.ai").setup()
      require("mini.bracketed").setup()
      local miniclue = require("mini.clue")
      miniclue.setup({
        triggers = {
          -- Leader triggers
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },

          -- Built-in completion
          { mode = "i", keys = "<C-x>" },

          -- `g` key
          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },

          -- Marks
          { mode = "n", keys = "'" },
          { mode = "n", keys = "`" },
          { mode = "x", keys = "'" },
          { mode = "x", keys = "`" },

          -- Registers
          { mode = "n", keys = '"' },
          { mode = "x", keys = '"' },
          { mode = "i", keys = "<C-r>" },
          { mode = "c", keys = "<C-r>" },

          -- Window commands
          { mode = "n", keys = "<C-w>" },

          -- `z` key
          { mode = "n", keys = "z" },
          { mode = "x", keys = "z" },
        },
        clues = {
          { mode = "n", keys = "<leader>f", desc = "+Files" },
          { mode = "n", keys = "<leader>b", desc = "+Buffers" },
          { mode = "n", keys = "<leader>s", desc = "+Search" },
          { mode = "n", keys = "<leader>g", desc = "+Git" },
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
        },
      })
      require("mini.comment").setup()
      require("mini.cursorword").setup()
      require("mini.files").setup({
        windows = {
          max_number = 4,
          preview = true,
          width_focus = 40,
          width_preview = 40,
        },
      })
      require("mini.icons").setup()
      require("mini.move").setup()
      require("mini.pairs").setup()
      require("mini.sessions").setup()
      require("mini.surround").setup({
        mappings = {
          add = "gza", -- Add surrounding in Normal and Visual modes
          delete = "gzd", -- Delete surrounding
          find = "gzf", -- Find surrounding (to the right)
          find_left = "gzF", -- Find surrounding (to the left)
          highlight = "gzh", -- Highlight surrounding
          replace = "gzr", -- Replace surrounding
          update_n_lines = "gzn", -- Update `n_lines`
        },
      })
    end,
    keys = {
      {
        "<leader>fm",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open file manager",
      },
    },
  },
}
