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


-- Disable relative numbers in command mode
vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
   pattern = "*",
   callback = function()
     vim.opt.relativenumber = false
     vim.cmd "redraw"
   end,
})

-- Enable relative numbers after leaving command mode
vim.api.nvim_create_autocmd({ "CmdlineLeave" }, {
   pattern = "*",
   callback = function()
     vim.opt.relativenumber = true
   end,
})
