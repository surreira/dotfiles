require("neo-tree").setup {
	close_if_last_window = true,
	filesystem = {
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_by_name = {
				".DS_Store",
				"thumbs.db",
				"node_modules",
				"build",
			},
			never_show = {
				".git",
			},
		},
		follow_current_file = {
			enabled = true,
		},
	},
	window = {
		position = "right",
	},
}

vim.keymap.set("n", "<leader>fe", function()
	require("neo-tree.command").execute({ dir = vim.loop.cwd() })
end, { desc = "Open the [F]ile [E]xplorer" })
vim.keymap.set("n", "<leader>tfe", function()
	require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
end, { desc = "[T]oggle [F]ile [E]xplorer" })
