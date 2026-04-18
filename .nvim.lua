vim.keymap.set("n", "<leader>/", function()
	Snacks.picker.grep({ hidden = true })
end, { desc = "Grep (include hidden)" })

vim.keymap.set("n", "<leader>ff", function()
	Snacks.picker.files({ hidden = true })
end, { desc = "Find files (include hidden)" })
