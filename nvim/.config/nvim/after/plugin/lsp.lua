local utils = require('utils')

-- IMPORTANT: neodev needs to be setup before lsp config.
require("neodev").setup()

require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    -- Web development
    "html",
    "ts_ls",
    "cssls",
    "tailwindcss",
    "astro",
    "emmet_ls",

    "volar", -- Vue
    "pyright", -- Python
    "elixirls", -- Elixir
    "lua_ls", -- Lua

    -- Docker
    "docker_compose_language_service",
    "dockerls"
  }
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

local lsp_attach = function()
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


require('mason-lspconfig').setup_handlers({
  function(server)
    -- Configure Lua language server similarly,
    -- but fix undefined vim global.
    if server == 'lua_ls' then
      lspconfig[server].setup({
        on_attach = lsp_attach,
        capabilities = lsp_capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        }
      })
    elseif server == 'emmet_ls' then
      lspconfig[server].setup({
        on_attach = lsp_attach,
        capabilities = lsp_capabilities,
        filetypes = {
          "astro",
          "html",
          "htmldjango",
          "twig",
          "javascriptreact",
          "markdown",
          "svelte",
          "templ",
          "typescriptreact",
          "vue",
          "elixir"
        }
      })
    elseif server == 'tailwindcss' then
      lspconfig[server].setup({
        on_attach = lsp_attach,
        capabilities = lsp_capabilities,
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
            experimental = {
              classRegex = {
                [[class= "([^"]*)]],
                [[class: "([^"]*)]],
                '~H""".*class="([^"]*)".*"""',
              },
            },
          },
        }

      })
    else
      lspconfig[server].setup({
        on_attach = lsp_attach,
        capabilities = lsp_capabilities,
      })
    end
  end,
})

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    completion = {
        completeopt = 'menu,menuone,noinsert'
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
        { name = 'path' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'buffer' },
    })
})
