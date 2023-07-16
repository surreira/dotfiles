vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Detect tabstop and shiftwidth automatically
  use 'tpope/vim-sleuth'

  -- Show pending keybinds
  use 'folke/which-key.nvim'

  -- Indentation guides
  use 'lukas-reineke/indent-blankline.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'shaunsingh/nord.nvim',
	  as = 'nord',
	  config = function()
		  vim.cmd('colorscheme nord')
	  end
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use("nvim-treesitter/nvim-treesitter-context")
  use 'mbbill/undotree'
  -- use 'nvim-tree/nvim-web-devicons'
  use 'kyazdani42/nvim-web-devicons'
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
  use 'tpope/vim-commentary'
  use 'nvim-lualine/lualine.nvim'
  use {
	  'akinsho/bufferline.nvim', tag = 'v3.*',
  }
  use {
      'lewis6991/gitsigns.nvim', tag = 'release',
  }
end)
