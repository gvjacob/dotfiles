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

-- Reset textwidth when opening twig files.
-- There's an issue where text wraps at 80 characters
-- even if textwidth is set to 0 in settings.lua
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.twig",
  callback = function()
    vim.opt.textwidth = 0
  end,
  desc = "Reset textwidth when opening twig files"
})

vim.cmd([[
  " Automatically wrap lines for markdown files.
  autocmd FileType markdown setlocal wrap
  autocmd FileType markdown setlocal linebreak
   
  " Wrap lines at 80 characters for markdown files.
  autocmd FileType markdown setlocal textwidth=80
]])

