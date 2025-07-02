return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	-- init = function()
	-- 	vim.cmd.colorscheme("tokyonight-storm")
	-- end,
	opts = {
		transparent = false,
		styles = {
			sidebars = "normal",
		},
		on_colors = function(colors)
			colors.bg_statusline = colors.bg_dark
		end,
		on_highlights = function(highlights, colors)
			highlights.ColorColumn = {
				bg = colors.bg_statusline,
			}
		end,
	},
}
