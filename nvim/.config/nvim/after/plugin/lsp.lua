require('utils')

-- IMPORTANT: neodev needs to be setup before lsp config.
require("neodev").setup()

require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    -- Web development
    "html",
    "tsserver",
    "cssls",
    "tailwindcss",
    "astro",
    "svelte",
    "emmet_ls",
    "volar",

    -- Python
    "pyright",

    -- Elixir
    "elixirls",

    -- Lua
    "lua_ls",

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
        filetypes = { "astro", "html", "twig", "javascriptreact", "svelte", "templ", "typescriptreact", "vue" }
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
        { name = 'cmp-tw2css' },
    }, {
        { name = 'buffer' },
        { name = 'path' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})
