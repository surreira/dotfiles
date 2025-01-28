vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, { desc = "Disable autoformat-on-save", bang = true })

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, { desc = "Re-enable autoformat-on-save" })

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	config = function()
		local conform = require("conform")

		conform.setup({
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return {
					timeout_ms = 500,
					async = false,
					lsp_fallback = true,
				}
			end,
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
