-- Changes the background mode based on macOS's appearance setting.
local function changeBackground()
	local m = vim.fn.system("defaults read -g AppleInterfaceStyle")
	m = m:gsub("%s+", "")
	if m == "Dark" then
		vim.o.background = "dark"
	end
end

require("tokyonight").setup({
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
})

vim.cmd.colorscheme("tokyonight-storm")
changeBackground()