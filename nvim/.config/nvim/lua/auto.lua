-- Cast .mdx files as "markdown"
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.mdx",
  command = [[ set filetype=markdown ]]
})

-- Cast .templ files as "templ"
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.templ",
  command = [[ set filetype=templ ]]
})

