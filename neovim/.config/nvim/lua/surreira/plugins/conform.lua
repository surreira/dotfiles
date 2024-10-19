return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	config = function()
		local conform = require("conform")

		conform.setup({
			format_on_save = {
				timeout_ms = 500,
				async = false,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				astro = { "prettier" },
				blade = { "blade-formatter" },
				css = { "prettier" },
				html = { "prettier" },
				javascript = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				typescript = { "prettier" },
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
