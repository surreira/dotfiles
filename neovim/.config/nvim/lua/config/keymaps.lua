-- Keymap for better default experience
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move visual selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "[J] Move visual selection Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "[K] Move visual selection Up" })

-- Faster buffer navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Buffer scroll [D]own" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Buffer scroll [U]p" })

-- Block "." in normal mode to prevent repeating the last change
vim.api.nvim_set_keymap("n", ".", "<Nop>", { noremap = true })

-- Clear search highlight (vim.opt.hlsearch) with <Esc>
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Easier window switch
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Resize split buffers
vim.keymap.set("n", "<leader>+", "<cmd>resize +5<CR>", { desc = "Increase vertical buffer size" })
vim.keymap.set("n", "<leader>-", "<cmd>resize -5<CR>", { desc = "Decrease vertical buffer size" })
vim.keymap.set("n", "<leader>º", "<cmd>vert res +5<CR>", { desc = "Increase horizontal buffer size" })
vim.keymap.set("n", "<leader>ª", "<cmd>vert res -5<CR>", { desc = "Decrease horizontal buffer size" })
