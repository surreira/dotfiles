return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
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

		vim.keymap.set({ "n", "v" }, "<leader>F", function()
			conform.format({
				lsp_fallback = true,
				async = true,
				timeout_ms = 1000,
			})
		end, { desc = "[F] format current buffer" })
	end,
}
