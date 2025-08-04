return {
  {
    "ibhagwan/fzf-lua",
    event = { "VeryLazy" },
    dependencies = { "echasnovski/mini.icons", "nvim-tree/nvim-web-devicons" },
    opts = function()
      local actions = require("fzf-lua.actions")
      return {
        defaults = {
          git_icons = true,
          file_icons = true,
          color_icons = true,
          formatter = "path.filename_first",
        },
        grep = {
          actions = {
            ["ctrl-G"] = { actions.grep_lgrep },
            ["ctrl-g"] = { actions.toggle_ignore },
            ["ctrl-h"] = { actions.toggle_hidden },
          },
        },
      }
    end,
    keys = function()
      local fzf = require("fzf-lua")
      return {
        -- files
        { "<leader><space>", fzf.files, desc = "Find files" },
        { "<leader>ff", fzf.files, desc = "Find files" },
        { "<leader>fr", fzf.oldfiles, desc = "Find recent files" },

        -- buffers
        { "<leader>,", fzf.buffers, desc = "Find buffers" },
        { "<leader>fb", fzf.buffers, desc = "Find buffers" },

        -- search
        { "<leader>/", fzf.live_grep, desc = "Search text" },
        { "<leader>st", fzf.live_grep, desc = "Search text" },
        { "<leader>sw", fzf.grep_cword, desc = "Search for word under cursor" },
        { '<leader>s"', fzf.registers, desc = "Search registers" },

        -- git
        { "<leader>gc", fzf.git_commits, desc = "Git commits" },
        { "<leader>gs", fzf.git_status, desc = "Git status" },
      }
    end,
  },
}
