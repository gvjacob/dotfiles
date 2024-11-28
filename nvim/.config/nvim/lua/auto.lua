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

-- Automatically disable relative numbers in command mode
vim.api.nvim_create_autocmd("CmdlineEnter", {
  pattern = "*",
  command = [[ set norelativenumber ]]
})

-- Automatically enable relative numbers after exiting command mode
vim.api.nvim_create_autocmd("CmdlineLeave", {
  pattern = "*",
  command = [[ set relativenumber ]]
})
