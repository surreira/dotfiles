vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Detect tabstop and shiftwidth automatically
  use 'tpope/vim-sleuth'

  -- Git related signs in the gutter
  use 'lewis6991/gitsigns.nvim'

  -- Show pending keybinds
  use 'folke/which-key.nvim'

  -- Nord theme
  use {
      'shaunsingh/nord.nvim', as = 'nord',
      config = function()
          vim.cmd('colorscheme nord')
      end
  }

  -- Lualine as statusline
  use 'nvim-lualine/lualine.nvim'

  -- Indentation guides
  use 'lukas-reineke/indent-blankline.nvim'

  -- Comment visual regions/lines
  use 'tpope/vim-commentary'

  -- Fuzzy finder
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Highlight, edit, and navigate code
  use {
      'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }
  }
  use 'nvim-treesitter/nvim-treesitter-context'

  -- Undo history visualizer
  use 'mbbill/undotree'

  use 'kyazdani42/nvim-web-devicons'

  -- File explorer
  use 'nvim-tree/nvim-tree.lua'

  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {                                      -- Optional
              'williamboman/mason.nvim',
              run = function()
                 pcall(vim.cmd, 'MasonUpdate')
              end,
          },
          {'williamboman/mason-lspconfig.nvim'}, -- Optional

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},     -- Required
          {'hrsh7th/cmp-nvim-lsp'}, -- Required
          {'L3MON4D3/LuaSnip'},     -- Required
      }
  }
  use 'jose-elias-alvarez/null-ls.nvim'
end)
