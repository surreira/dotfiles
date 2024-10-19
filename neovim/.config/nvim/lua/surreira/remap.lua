-- Keymap for better default experience
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Move visual selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "[J] Move visual selection Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "[K] Move visual selection Up" })

-- Faster buffer navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Buffer scroll [D]own" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Buffer scroll [U]p" })

-- Telescope Keymaps
-- [S]earch
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader><space>", builtin.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>si", function()
	builtin.grep_string({ search = vim.fn.input("Search Word > ") })
end, { desc = "[S]earch [I]nput word" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sv", builtin.git_files, { desc = "[S]earch [V]ersioned git files" })
vim.keymap.set("n", "<leader>sf", function()
	builtin.find_files({ hidden = true })
end, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "[S]earch Recent Files" })
vim.keymap.set("n", "<leader>/", function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

-- Diagnostics Keymaps
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics [Q]uickfix list" })

-- Block "." in normal mode to prevent repeating the last change
vim.api.nvim_set_keymap("n", ".", "<Nop>", { noremap = true })

-- Clear search highlight (vim.opt.hlsearch) with <Esc>
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Easier window switch
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- File tree keymaps
vim.keymap.set("n", "<leader>fe", function()
	require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
end, { desc = "[F]ile [E]xplorer" })

-- Resize split buffers
vim.keymap.set("n", "<leader>+", "<cmd>resize +5<CR>", { desc = "Increase vertical buffer size" })
vim.keymap.set("n", "<leader>-", "<cmd>resize -5<CR>", { desc = "Decrease vertical buffer size" })
vim.keymap.set("n", "<leader>º", "<cmd>vert res +5<CR>", { desc = "Increase horizontal buffer size" })
vim.keymap.set("n", "<leader>ª", "<cmd>vert res -5<CR>", { desc = "Decrease horizontal buffer size" })
