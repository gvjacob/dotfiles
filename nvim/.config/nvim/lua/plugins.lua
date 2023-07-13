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
  use 'lewis6991/gitsigns.nvim'

  --------------------------------------------
  -- Editor
  --------------------------------------------
  use "lukas-reineke/indent-blankline.nvim"
  use "windwp/nvim-autopairs"
  use "github/copilot.vim"
  use "fedepujol/move.nvim"
  use "folke/zen-mode.nvim"
  use "declancm/cinnamon.nvim"
  use "Olical/vim-enmasse"
  use "kevinhwang91/nvim-bqf"
  use "folke/which-key.nvim"

  use {
    'ggandor/leap.nvim',
    requires = { 'tpope/vim-repeat' }
  }

  use {
    "folke/noice.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
    }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      { 'BurntSushi/ripgrep', opt = true },
    }
  }

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }

  use { "ellisonleao/glow.nvim", config = function() require("glow").setup() end }

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
    requires = {
      "williamboman/mason.nvim-lspconfig",
      "jay-babu/mason-null-ls.nvim"
    }
  }
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'L3MON4D3/LuaSnip'
  use 'numToStr/Comment.nvim'
  use 'folke/trouble.nvim'
  use 'jinzhongjia/LspUI.nvim'
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
  use 'NoahTheDuke/vim-just'
  use 'folke/neodev.nvim'
end)
