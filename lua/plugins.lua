vim.cmd [[packadd packer.nvim]]

require'packer'.startup(function(use)
  -- Packer can manage itself
	use 'wbthomason/packer.nvim'

   -- my plugins
   use 'Nate96/journal.nvim'


   -- vs code theme
   -- https://github.com/Mofiqul/vscode.nvim
	use 'Mofiqul/vscode.nvim'
   use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
         local ts_update = require('nvim-treesitter.install')
                              .update({ with_sync = true })
         ts_update()
      end,
   }

   -- Navigating files faster
   -- https://github.com/ThePrimeagen/harpoon
	use('ThePrimeagen/harpoon')

   -- the best undoing system ever. 
   -- https://github.com/mbbill/undotree
	use('mbbill/undotree')


   -- searching through projects
   -- https://github.com/mbbill/undotree
	use('tpope/vim-fugitive')
   use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                            , branch = '0.1.x',
      requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'nvim-telescope/telescope-borderless.nvim'

  -- Lsp
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
      { 'kristijanhusak/cmp-dadbod' }, -- Optional
      { 'L3MON4D3/LuaSnip' },   -- Required
    }
  }

use { "github/copilot.vim" }

  -- Dadbod
  use {
    'tpope/vim-dadbod',
    requires = {
      'kristijanhusak/vim-dadbod-ui',
      'kristijanhusak/vim-dadbod-completion',
    },
  }

-- Note Books
-- https://github.com/Vigemus/iron.nvim
use {'Vigemus/iron.nvim'}

end)


print("Go Pack Go!!!")
