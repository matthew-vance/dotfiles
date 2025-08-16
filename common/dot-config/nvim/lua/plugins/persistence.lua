return {
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {},
		keys = function()
			return {
        -- stylua: ignore start
        {"<leader>qs", function() require("persistence").load() end, desc = "Load session for the current directory"},
        {"<leader>qS", function() require("persistence").select() end, desc = "Select session to load"},
        {"<leader>ql", function() require("persistence").load({last = true}) end, desc = "Load last session"},
        {"<leader>qd", function() require("persistence").stop() end, desc = "Stop persistence => Do not save on exit"},
				-- stylua: ignore end
			}
		end,
	},
}
