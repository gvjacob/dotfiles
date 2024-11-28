vim.g.mapleader = " "
vim.g.user_emmet_leader_key = "<C-e>"

--------------------------------------
-- THEME
--------------------------------------
vim.opt.termguicolors = true

--------------------------------------
-- WINDOWS
--------------------------------------
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Remove bottom command line
vim.opt.cmdheight = 0

--------------------------------------
-- LINE NUMBERS
--------------------------------------
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Set line number color
vim.cmd [[ highlight LineNr ctermfg=grey ]]

--------------------------------------
-- FILES
--------------------------------------
vim.opt.swapfile = false

--------------------------------------
-- SEARCH
--------------------------------------
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

--------------------------------------
-- TABS
--------------------------------------
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

--------------------------------------
-- LINES
--------------------------------------
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.scrolloff = 20

-- @see https://github.com/neovim/neovim/issues/27260
vim.opt.formatoptions = vim.opt.formatoptions - 'j'

vim.cmd([[
  " Automatically wrap lines for markdown files.
  autocmd FileType markdown setlocal wrap
]])

--------------------------------------
-- TIMEOUT
--------------------------------------
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0

--------------------------------------
-- MISC
--------------------------------------
vim.opt.updatetime = 1000
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'

-- Hide split line in vertical split
vim.cmd [[ highlight VertSplit ctermbg=NONE ctermfg=NONE ]]

-- Remove background color on SignColumn
vim.cmd [[ highlight clear SignColumn ]]
