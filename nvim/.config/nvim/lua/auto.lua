-- Cast mdx files as markdown
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.mdx",
  command = [[ set filetype=markdown ]]
})

