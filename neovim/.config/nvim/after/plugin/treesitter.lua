require('nvim-treesitter.configs').setup {
  ensure_installed = { "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query", "python", "astro", "tsx", "css",
    "comment", "html", "markdown", "markdown_inline", "php", "sql", "gitignore", "git_config", "gitcommit", "dockerfile",
    "yaml" },

  modules = {},
  auto_install = false,
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
      init_selection = '<C-space>',
      node_incremental = '<C-space>',
      scope_incremental = '<C-s>',
      node_decremental = '<BS>',
    },
  },

  textobjects = {
    enable = true
  },
}
