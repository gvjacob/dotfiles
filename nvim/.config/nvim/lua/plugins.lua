-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  --------------------------------------------
  -- Themes
  --------------------------------------------
  use "EdenEast/nightfox.nvim"

  --------------------------------------------
  -- Git
  --------------------------------------------
  use 'tpope/vim-fugitive'
  use { 'lewis6991/gitsigns.nvim', tag = 'release' }

  --------------------------------------------
  -- Editor
  --------------------------------------------
  use "lukas-reineke/indent-blankline.nvim"
  use 'szw/vim-maximizer'
  use "windwp/nvim-autopairs"
  use "github/copilot.vim"

  use {
    'ggandor/leap.nvim',
    requires = { 'tpope/vim-repeat' }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      { 'kyazdani42/nvim-web-devicons', opt = true },
      { 'BurntSushi/ripgrep', opt = true },
    }
  }

  use {
    'scrooloose/nerdtree',
    requires = { 'PhilRunninger/nerdtree-visual-selection' }
  }

  --------------------------------------------
  -- Search
  --------------------------------------------
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    }
  }

  --------------------------------------------
  -- LSP
  --------------------------------------------
  use {
    "williamboman/mason.nvim",
    requires = { "williamboman/mason.nvim-lspconfig" }
  }
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'L3MON4D3/LuaSnip'
  use 'numToStr/Comment.nvim'
  use 'folke/trouble.nvim'
  use { "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  --------------------------------------------
  -- Languages
  --------------------------------------------
  use 'jose-elias-alvarez/typescript.nvim'
  use 'mattn/emmet-vim'
end)
