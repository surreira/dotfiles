return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		icons = {
			mappings = vim.g.have_nerd_font,
		},
		spec = {
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>g", group = "[G]it", mode = { "n", "v" } },
			{ "<leader>c", group = "[C]ode" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer local keymaps (which-key)"
		},
	},
}
