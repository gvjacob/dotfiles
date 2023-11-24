require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "typescript", "html", "twig", "elixir", "astro" },
  highlight = {
    enable = true,
  },
}
