return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  opts = {},
  config = function(_, opts)
    local fzf = require("fzf-lua")
    fzf.register_ui_select()
    fzf.setup(opts)
  end,
  keys = function()
    local fzf = require("fzf-lua")
    return {
      {
        "<leader>ff",
        fzf.files,
        desc = "[F]ind [F]iles",
      },
      {
        "<leader>faf",
        function()
          fzf.files({ hidden = true, no_ignore = true })
        end,
        desc = "[F]ind [A]ll [F]iles",
      },
      { "<leader>fr", fzf.oldfiles, desc = "[F]ind [R]ecent files" },
      { "<leader>fb", fzf.buffers, desc = "[F]ind [B]uffer" },
      {
        "<leader>fic",
        fzf.lgrep_curbuf,
        desc = "[F]ind [I]n [C]urrent buffer",
      },
      {
        "<leader>fw",
        fzf.grep_cword,
        desc = "[F]ind [W]ord under cursor",
      },
      { "<leader>fR", fzf.resume, desc = "[F]ind [R]esume" },
      { "<leader>fh", fzf.helptags, desc = "[F]ind [H]elp" },
      { "<leader>fk", fzf.keymaps, desc = "[F]ind [K]eymaps" },
      {
        "<leader>fs",
        function()
          fzf.live_grep_native({ hidden = true })
        end,
        desc = "[F]ind [S]tring in current directory",
      },
    }
  end,
}
