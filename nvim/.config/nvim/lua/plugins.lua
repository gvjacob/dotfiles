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
  "windwp/nvim-autopairs",
  "github/copilot.vim",
  "fedepujol/move.nvim",
  "Olical/vim-enmasse",

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
  },

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
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "ellisonleao/glow.nvim",
    config = {
      glow_path = "/opt/homebrew/bin/glow",
    },
    cmd = "Glow"
  },

  --------------------------------------------
  -- Search
  --------------------------------------------
  {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    tag = '0.1.4',
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

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "jcha0713/cmp-tw2css",
    }
  },

  "stevearc/dressing.nvim",
  "L3MON4D3/LuaSnip",
  "numToStr/Comment.nvim",
  "folke/trouble.nvim",

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
