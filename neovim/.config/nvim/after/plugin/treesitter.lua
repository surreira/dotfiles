require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"astro",
		"bash",
		"c",
		"comment",
		"css",
		"dockerfile",
		"gitcommit",
		"gitignore",
		"git_config",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"php",
		"python",
		"query",
		"toml",
		"tsx",
		"typescript",
		"sql",
		"vim",
		"vimdoc",
		"yaml",
	},

	modules = {},
	auto_install = true,
	sync_install = false,
	ignore_install = {},

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	indent = { enable = true },

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-space>",
			node_incremental = "<C-space>",
			scope_incremental = "<C-s>",
			node_decremental = "<BS>",
		},
	},

	textobjects = {
		enable = true,
	},
})
