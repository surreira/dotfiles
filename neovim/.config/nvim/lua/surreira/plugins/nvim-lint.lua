return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		local cspell = lint.linters.cspell
		cspell.args = {
			"lint",
			"--config",
			vim.fn.expand("$HOME/.config/cspell/cspell.json"),
		}

		lint.linters_by_ft = {
			astro = { "cspell" },
			bash = { "shellcheck", "cspell" },
			blade = { "cspell" },
			html = { "cspell" },
			javascript = { "cspell" },
			javascriptreact = { "cspell" },
			json = { "cspell" },
			markdown = { "cspell" },
			php = { "cspell" },
			python = { "cspell" },
			sh = { "shellcheck", "cspell" },
			text = { "cspell" },
			typescript = { "cspell" },
			typescriptreact = { "cspell" },
			zsh = { "cspell" },
		}

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
			group = vim.api.nvim_create_augroup("RunLinter", { clear = true }),
			callback = function()
				lint.try_lint("cspell")
			end,
		})
	end,
}
