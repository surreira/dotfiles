require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters_by_ft = {
		python = { "isort", "black" },
		lua = { 'stylua' },
		javascript = { "prettierd", "prettier" },
	},
})
