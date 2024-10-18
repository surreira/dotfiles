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
			blade = { "cspell" },
			html = { "cspell" },
			javascript = { "cspell" },
			javascriptreact = { "cspell" },
			json = { "cspell" },
			markdown = { "cspell" },
			php = { "cspell" },
			python = { "cspell" },
			text = { "cspell" },
			typescript = { "cspell" },
			typescriptreact = { "cspell" },
		}

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
