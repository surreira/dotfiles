vim.opt.list = true
vim.opt.listchars:append("space:·")
vim.opt.listchars:append("eol:¬") -- or "⏎"

require("ibl").setup({
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
})
