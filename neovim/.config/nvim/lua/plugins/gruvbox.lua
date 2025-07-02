return {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	config = true,
	init = function()
		vim.cmd.colorscheme("gruvbox")
	end,
	opts = {
		contrast = "hard",
		-- invert_signs = true,
		-- transparent_mode = true,
	},
}
