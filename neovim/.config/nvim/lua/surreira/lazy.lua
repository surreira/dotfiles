-- Inspired by kickstart.nvim

-- Install lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Changes the background mode based on macOS's appearance setting.
local function changeBackground()
    local m = vim.fn.system("defaults read -g AppleInterfaceStyle")
    m = m:gsub("%s+", "")
    if m == "Dark" then
        vim.o.background = 'dark'
    else
        vim.o.background = 'light'
    end
end

local plugins = {
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    -- "gc" to comment visual regions/lines
    'tpope/vim-commentary',

    -- VimBeGood
    {
        'ThePrimeagen/vim-be-good',
        cmd = 'VimBeGood',
    },

    -- LSP related plugins
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
            { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },
            { 'folke/lazydev.nvim',      ft = 'lua',     opts = {} },
        },
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            {
                'L3MON4D3/LuaSnip',
                dependencies = {
                    {
                        'rafamadriz/friendly-snippets',
                        config = function()
                            require('luasnip.loaders.from_vscode').lazy_load()
                        end,
                    },
                },
            },
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
        },
    },

    -- Show pending keybinds
    { 'folke/which-key.nvim',    opts = {} },

    -- Git related signs in the gutter
    { 'lewis6991/gitsigns.nvim', opts = {} },

    -- Tokyonight theme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            light_style = "day",
            styles = {
                sidebars = "normal",
                floats = "normal",
            },
        },
        config = function()
            vim.cmd.colorscheme 'tokyonight-storm'
            changeBackground()
        end
    },

    -- Lualine as statusline
    { 'nvim-lualine/lualine.nvim' },

    -- Indentation guides
    { 'lukas-reineke/indent-blankline.nvim', main = "ibl" },

    -- Fuzzy finder
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
    },

    -- Highlight, edit, and navigate code
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'nvim-treesitter/nvim-treesitter-context',
        },
        build = ':TSUpdate'
    },

    -- File formatter
    {
        'stevearc/conform.nvim',
        lazy = false,
    },

    -- File explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }
}

require('lazy').setup(plugins, {})
