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
				bash = { "shfmt" },
				blade = { "blade-formatter" },
				css = { "prettier" },
				html = { "prettier" },
				htmldjango = { "prettier" },
				javascript = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				sh = { "shfmt" },
				typescript = { "prettier" },
				zsh = { "shfmt" },
			},
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2", "-ci" },
				},
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
