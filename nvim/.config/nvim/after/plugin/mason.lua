require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    "tsserver",
    "solargraph",
    "html",
    "cssls",
    "tailwindcss",
    "astro"
  }
})

