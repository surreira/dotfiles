vim.opt.list = true
vim.opt.listchars:append "space:·"
vim.opt.listchars:append "eol:¬" -- or "⏎"

require("indent_blankline").setup {
	char = '┊',
	show_current_context = true,
	show_current_context_start = true,
	show_end_of_line = true,
	show_trailing_blankline_indent = false,
}
