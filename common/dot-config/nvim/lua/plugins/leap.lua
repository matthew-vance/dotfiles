return {
  {
    "ggandor/leap.nvim",
    config = function(_, opts)
      local leap = require("leap")
      leap.add_default_mappings()
      leap.opts.equivalence_classes = { " \t\r\n", "([{", ")]}", "'\"`" }
      require("leap.user").set_repeat_keys("<enter>", "<backspace>")
    end,
    keys = {
      { "s", "<Plug>(leap)" },
      { "S", "<Plug>(leap-from-window)" },
      { "s", "<Plug>(leap-forward)", mode = { "x", "o" } },
      { "S", "<Plug>(leap-backward)", mode = { "x", "o" } },
    },
  },
  {
    "ggandor/flit.nvim",
    opts = {
      labeled_modes = "nx",
    },
  },
}
