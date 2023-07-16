vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({"n", "v"}, "<Space>", "<Nop>", { silent = true })

vim.keymap.set("n", "<leader>pv", require("nvim-tree.api").tree.toggle, { desc = "[pv] Open or close the Tree" })
vim.keymap.set("n", "<leader>e", require("nvim-tree.api").tree.focus, { desc = "[e] Focus Tree" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "[F]ormat current buffer with LSP" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "[J] Move visual selection Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "[K] Move visual selection Up" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Buffer scroll [D]own" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Buffer scroll [U]p" })

vim.keymap.set("n", "<leader>gn", require("gitsigns").next_hunk, { buffer = bufnr, desc = "[G]o to [N]ext Hunk" })
vim.keymap.set("n", "<leader>gp", require("gitsigns").prev_hunk, { buffer = bufnr, desc = "[G]o to [P]revious Hunk" })

vim.keymap.set("n", "<leader>pf", require("telescope.builtin").find_files, { desc = "[pf] Find files" })
vim.keymap.set('n', '<C-p>', require("telescope.builtin").git_files, { desc = "Search git files" })
vim.keymap.set('n', '<leader>ps', function()
    require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "[P]roject file [S]earch" })
