return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "j-hui/fidget.nvim", opts = {} },
	},
	opts = {
		format_on_save = function(bufnr)
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return {
				timeout_ms = 1500,
				async = false,
				lsp_fallback = true,
			}
		end,
		formatters_by_ft = {
			astro = { "prettierd", "prettier", stop_after_first = true },
			bash = { "shfmt" },
			blade = { "blade-formatter" },
			css = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			htmldjango = { "prettierd", "prettier", stop_after_first = true },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			lua = { "stylua" },
			python = { "isort", "black" },
			sh = { "shfmt" },
			scss = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			zsh = { "shfmt" },
		},
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2", "-ci" },
			},
			blade = {
				prepend_args = { "--wrap-attributes", "force-expand-multiline" },
			},
		},
	},
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({
					lsp_fallback = true,
					async = true,
					timeout_ms = 3000,
				})
			end,
			desc = "[C]ode [F]ormat",
		},
		{
			"<leader>fdg",
			function()
				vim.g.disable_autoformat = true
				require("fidget").notify(
					"Global code formatting disabled 🚫",
					vim.log.levels.INFO,
					{ title = "Code Formatting" }
				)
			end,
			desc = "[F]ormat [D]isable [G]lobally",
		},
		{
			"<leader>fdb",
			function()
				vim.b.disable_autoformat = true
				require("fidget").notify(
					"Buffer code formatting disabled 🚫",
					vim.log.levels.INFO,
					{ title = "Code Formatting" }
				)
			end,
			desc = "[F]ormat [D]isable in [B]uffer",
		},
		{
			"<leader>fa",
			function()
				vim.b.disable_autoformat = false
				vim.g.disable_autoformat = false
				require("fidget").notify(
					"Global code formatting activated ✅",
					vim.log.levels.INFO,
					{ title = "Code Formatting" }
				)
			end,
			desc = "[F]ormat [A]ctivated",
		},
	},
}
