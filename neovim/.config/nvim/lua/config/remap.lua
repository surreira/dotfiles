vim.g.mapleader = " "
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>pv', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>e', ':NvimTreeFocus<CR>')
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set('n', '<leader>b', ':Telescope buffers<CR>')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
