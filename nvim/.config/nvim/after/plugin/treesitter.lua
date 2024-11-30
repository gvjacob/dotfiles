require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "lua",
    "typescript",
    "tsx",
    "html",
    "twig",
    "elixir",
    "astro",
    "graphql",
    "vue",
    "heex",
    "go",
  },
  highlight = {
    enable = true,
  },
}
