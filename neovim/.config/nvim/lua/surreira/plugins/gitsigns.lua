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
		signs_staged = {
			add = { text = "+" },
		},
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function nmap(mode, l, r, desc)
				local opts = {}
				opts.buffer = bufnr
				opts.desc = desc
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			nmap("n", "<leader>gn", gs.next_hunk, "[G]it go to [N]ext Hunk")
			nmap("n", "<leader>gp", gs.prev_hunk, "[G]it go to [P]revious Hunk")

			-- Actions
			nmap("n", "<leader>gh", gs.preview_hunk, "[P]review [H]unk")
			nmap("v", "<leader>gs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "[G]it [S]tage Hunk")
			nmap("v", "<leader>gr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "[G]it [R]eset Hunk")
			nmap("n", "<leader>gu", gs.undo_stage_hunk, "[G]it [U]ndo staged Hunk")
			nmap("n", "<leader>gS", gs.stage_buffer, "[G]it [S]tage Buffer")
			nmap("n", "<leader>gR", gs.reset_buffer, "[G]it [R]eset Buffer")
		end,
	},
}
