return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function nmap(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			nmap("n", "<leader>gn", gs.next_hunk, { desc = "[G]o to [N]ext Hunk" })
			nmap("n", "<leader>gp", gs.prev_hunk, { desc = "[G]o to [P]revious Hunk" })

			-- Actions
			nmap("n", "<leader>ph", gs.preview_hunk, { desc = "[P]review [H]unk" })
		end,
	},
}
