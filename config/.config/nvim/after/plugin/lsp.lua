-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<Leader>dk', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', '<Leader>dj', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<Leader>dl', ':Telescope diagnostics<CR>', opts)
end 

lspconfig['html'].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig['tsserver'].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig['cssls'].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig['tailwindcss'].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig['astro'].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig['solargraph'].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig['lua_ls'].setup({
  capabilities = capabilities,
  on_attach = on_attach
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
