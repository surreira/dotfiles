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
			-- ["*"] = { "cspell" },
			bash = { "shellcheck" },
			sh = { "shellcheck" },
			pyhton = { "flake8" },
			javascript = { "eslint" },
		}

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
			group = vim.api.nvim_create_augroup("RunLinter", { clear = true }),
			callback = function()
				lint.try_lint()
				lint.try_lint("cspell")
			end,
		})
	end,
}
