return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		float = {
			max_width = 0.7,
			max_height = 0.7,
		},
		view_options = {
			show_hidden = true,
		},
	},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,
	keys = {
		{
			"-",
			function()
				require("oil").open_float()
			end,
			desc = "Open Oil plugin",
		},
	},
}
