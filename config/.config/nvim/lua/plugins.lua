-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Themes
  use "EdenEast/nightfox.nvim"

  -- Git
  use 'tpope/vim-fugitive'

  -- Editor
  use {
    'scrooloose/nerdtree',
    requires = {
      { 'PhilRunninger/nerdtree-visual-selection' },
    }
  }
  use 'easymotion/vim-easymotion'
  use 'szw/vim-maximizer'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      { 'kyazdani42/nvim-web-devicons', opt = true },
      { 'BurntSushi/ripgrep', opt = true },
    }
  }
  use("nvim-treesitter/nvim-treesitter", {
      run = ":TSUpdate"
  })
  use "lukas-reineke/indent-blankline.nvim"

  -- Search
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'L3MON4D3/LuaSnip'
  use {
    "williamboman/mason.nvim",
    "williamboman/mason.nvim-lspconfig"
  }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use 'numToStr/Comment.nvim'
  use 'folke/trouble.nvim'
  use "windwp/nvim-autopairs"

  -- Languages
  use 'jose-elias-alvarez/typescript.nvim'
  use 'mattn/emmet-vim'
end)
