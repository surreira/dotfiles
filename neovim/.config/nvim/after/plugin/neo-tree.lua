require("neo-tree").setup {
	filesystem = {
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_by_name = {
				"thumbs.db",
				"node_modules",
			},
			never_show = {
				".DS_Store",
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
