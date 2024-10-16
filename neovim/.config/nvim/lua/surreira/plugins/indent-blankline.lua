return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	opts = {
		indent = {
			char = "┊",
			tab_char = "│",
			smart_indent_cap = true,
		},
		whitespace = {
			highlight = {
				"Whitespace",
				"NonText",
			},
			remove_blankline_trail = false,
		},
	},
}
