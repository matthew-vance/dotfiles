return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "echasnovski/mini.icons" },
		opts = {},
		config = function(_, opts)
			local fzf = require("fzf-lua")
			fzf.setup(opts)
			fzf.register_ui_select()
		end,
		keys = function()
			local fzf = require("fzf-lua")
			local recent_files = function()
				fzf.combine({ pickers = "oldfiles,files" })
			end

			local smart_pick_buffer = function()
				local current = vim.api.nvim_get_current_buf()
				local listed = {}
				for _, b in ipairs(vim.api.nvim_list_bufs()) do
					if vim.fn.buflisted(b) == 1 and vim.api.nvim_buf_is_valid(b) then
						local bt = vim.bo[b].buftype
						local name = vim.api.nvim_buf_get_name(b)
						if bt == "" and name ~= "" then
							table.insert(listed, b)
						end
					end
				end

				if #listed <= 1 then
					recent_files()
					return
				end

				if #listed == 2 then
					local target = (listed[1] == current) and listed[2] or listed[1]
					if target ~= current then
						vim.cmd("buffer " .. target)
					else
						recent_files()
					end
					return
				end

				fzf.buffers()
			end
			return {
				{ "<leader>ff", fzf.files, desc = "Find Files" },
				{ "<leader>fr", fzf.oldfiles, desc = "Open Recent File" },
				{ "<leader>fg", fzf.live_grep_native, desc = "Live Grep" },
				{ "<leader>fb", fzf.buffers, desc = "Open Buffer" },
				{ "<leader>fj", fzf.jumps, desc = "Find Jumps" },
				{ "<leader>fm", fzf.marks, desc = "Find Marks" },
				{ "<leader><leader>", smart_pick_buffer, desc = "Smart Open Buffer" },
				{ "<leader>fh", fzf.help_tags, desc = "Help Tags" },
				{ "<leader>fw", fzf.grep_cword, desc = "Grep Word Under Cursor" },
				{ "<leader>fk", fzf.keymaps, desc = "Find Keymaps" },
				{ "<leader>gf", fzf.git_files, desc = "Git Files" },
				{ "<leader>gs", fzf.git_status, desc = "Git Status" },
			}
		end,
	},
}
