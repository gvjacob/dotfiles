local utils = require('utils')

vim.diagnostic.config({
  virtual_text = true,
})

require('mason').setup()

require('mason-lspconfig').setup({
  automatic_enable = true,
  ensure_installed = {
    -- Web development
    "html",
    "ts_ls",
    "cssls",
    "tailwindcss",
    "astro",
    "emmet_ls",
    "twiggy_language_server", -- twig

    "vue_ls", -- Vue
    "pyright", -- Python
    "lua_ls", -- Lua

    -- Docker
    "docker_compose_language_service",
    "dockerls"
  }
})

-- LSP keymaps (set up via LspAttach autocmd)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function()
    utils.nmap('K', vim.lsp.buf.hover)
    utils.nmap('ga', vim.lsp.buf.code_action)
    utils.nmap('gd', vim.lsp.buf.definition)
    utils.nmap('gt', vim.lsp.buf.type_definition)
    utils.nmap('gi', vim.lsp.buf.references)
    utils.nmap('gr', vim.lsp.buf.rename)
    utils.nmap('<Leader>dk', vim.diagnostic.goto_prev)
    utils.nmap('<Leader>dj', vim.diagnostic.goto_next)
    utils.nmap('<Leader>dl', ':Telescope diagnostics<CR>')
  end
})

-- Per-server LSP configurations
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('*', {
  capabilities = lsp_capabilities,
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

local mason_packages = vim.fn.stdpath('data') .. '/mason/packages'
local ts_plugin_path = mason_packages .. '/vue-language-server/node_modules/@vue/typescript-plugin'
local ts_sdk_path = mason_packages .. '/typescript-language-server/node_modules/typescript/lib'

vim.lsp.config('vue_ls', {
  init_options = {
    typescript = {
      tsdk = ts_sdk_path,
    },
  },
})

vim.lsp.config('ts_ls', {
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
  },
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = ts_plugin_path,
        languages = { 'vue' },
      },
    },
  },
})

vim.lsp.config('emmet_ls', {
  filetypes = {
    "astro",
    "html",
    "htmldjango",
    "heex",
    "twig",
    "javascriptreact",
    "markdown",
    "svelte",
    "templ",
    "typescriptreact",
    "vue",
    "elixir"
  },
})

vim.lsp.config('tailwindcss', {
  filetypes = {
    "astro",
    "html",
    "twig",
    "javascriptreact",
    "markdown",
    "svelte",
    "templ",
    "typescriptreact",
    "vue",
    "css",
    "heex",
    "elixir",
    "eelixir"
  },
  init_options = {
    userLanguages = {
      templ = "html",
      elixir = "html-eex",
      eelixir = "html-eex",
      heex = "html-eex"
    }
  },
  settings = {
    tailwindCSS = {
      classFunctions = { "cva", "clsx", "cn" },
    },
  },
})
