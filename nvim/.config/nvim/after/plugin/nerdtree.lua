require('utils')

vim.g.NERDTreeShowLineNumbers = true
vim.g.NERDTreeShowHidden = true
vim.g.NERDTreeIgnore = { '.pyc$', '.DS_Store', '.git$' }
vim.g.NERDTreeNodeDelimiter = '\u{00a0}'

-- Exit Vim if NERDTree is the only window left.
vim.cmd([[
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
      \ quit | endif
]])

utils.nmap("<Leader>f", ":NERDTreeToggle<CR>")
utils.nmap("<Leader>F", ":NERDTreeRefreshRoot <Bar> :NERDTreeFind<CR>")
