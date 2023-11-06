local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  --------------------------------------------
  -- Themes
  --------------------------------------------
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000
  },

  --------------------------------------------
  -- Git
  --------------------------------------------
  "lewis6991/gitsigns.nvim",

  --------------------------------------------
  -- Editor
  --------------------------------------------
  "lukas-reineke/indent-blankline.nvim",
  "windwp/nvim-autopairs",
  "github/copilot.vim",
  "fedepujol/move.nvim",
  "folke/zen-mode.nvim",
  "Olical/vim-enmasse",
  "kevinhwang91/nvim-bqf",
  "folke/which-key.nvim",

  {
    'ggandor/leap.nvim',
    dependencies = { 'tpope/vim-repeat' }
  },

  {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim" }
  },

  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = {
      { 'BurntSushi/ripgrep', lazy = true },
    }
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },

  {
    "ellisonleao/glow.nvim",
    config = function() require("glow").setup() end
  },

  --------------------------------------------
  -- Search
  --------------------------------------------
  {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    tag = '0.1.0',
    dependencies = {
      "nvim-lua/plenary.nvim",
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    }
  },

  --------------------------------------------
  -- LSP
  --------------------------------------------
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason.nvim-lspconfig",
      "jay-babu/mason-null-ls.nvim"
    }
  },
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "L3MON4D3/LuaSnip",
  "numToStr/Comment.nvim",
  "folke/trouble.nvim",

  {
    "jinzhongjia/LspUI.nvim",
    branch = "legacy"
  },

  {
    "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  --------------------------------------------
  -- Languages
  --------------------------------------------
  "jose-elias-alvarez/typescript.nvim",
  "NoahTheDuke/vim-just",
  "folke/neodev.nvim",
  "mattn/emmet-vim",
})
