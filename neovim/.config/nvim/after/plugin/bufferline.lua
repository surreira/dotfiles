local highlights = require("nord").bufferline.highlights({
	italic = true,
	bold = true
})

vim.opt.termguicolors = true
require("bufferline").setup{
	options = {
		offsets = { text_align = "left" },
        color_icons = true,
		separator_style = "thick",
        indicator = { style = "icon" },
		show_buffer_close_icons = false,
        show_buffer_icons = true,
		show_close_icon = false,
		show_tab_indicators = true,
		always_show_bufferline = false,
	},
	highlights = highlights,
}
