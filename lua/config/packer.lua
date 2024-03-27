-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use 'Mofiqul/vscode.nvim'
   use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
         local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
         ts_update()
      end,
   }
	use('ThePrimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
   use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
      requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },           -- Required
      { 'williamboman/mason.nvim' },         -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },   -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },   -- Required
    }
  }

  print("packer has been loaded")
end)
