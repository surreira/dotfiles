-- Changes the background mode based on macOS's appearance setting.
local function changeBackground()
	local m = vim.fn.system("defaults read -g AppleInterfaceStyle")
	m = m:gsub("%s+", "")
	if m == "Dark" then
		vim.o.background = "dark"
	else
		vim.o.background = "light"
	end
end

vim.cmd.colorscheme("tokyonight-storm")
changeBackground()

require("tokyonight").setup({
	light_style = "day",
	styles = {
		sidebars = "normal",
		floats = "normal",
	},
	on_highlights = function(highlights, colors)
		highlights.ColorColumn = {
			bg = colors.bg_statusline,
		}
	end,
	on_colors = function() end,
})
