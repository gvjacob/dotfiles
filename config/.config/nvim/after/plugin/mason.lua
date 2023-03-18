require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    "tsserver",
    "html",
    "cssls",
    "tailwindcss",
    "astro"
  }
})

