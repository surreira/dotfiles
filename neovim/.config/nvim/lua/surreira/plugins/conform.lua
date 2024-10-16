return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			format_on_save = {
				timeout_ms = 500,
				async = false,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				python = { "isort", "black" },
				lua = { "stylua" },
				javascript = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				blade = { "blade-formatter" },
			},
		})
	end,
}
