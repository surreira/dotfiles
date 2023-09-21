require("formatter").setup {
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		python = {
			require("formatter.filetypes.python").black,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
	},
}
