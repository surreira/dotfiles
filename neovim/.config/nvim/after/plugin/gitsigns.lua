require("gitsigns").setup {
	signs = {
		add = { text = '+' },
		change = { text = '~' },
		delete = { text = '_' },
		topdelete = { text = '‾' },
		changedelete = { text = '~' },
	},
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "<leader>gn", gs.next_hunk, { desc = "[G]o to [N]ext Hunk" })
		map("n", "<leader>gp", gs.prev_hunk, { desc = "[G]o to [P]revious Hunk" })

		-- Actions
		map("n", "<leader>ph", gs.preview_hunk, { desc = "[P]review [H]unk" })
	end
}
