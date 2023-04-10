require('utils')

utils.nmap('<Tab>', ':b#<CR>')

--Exit out of search
utils.nmap('<Leader>r', ':noh<CR>')

-- Refresh current buffer
utils.nmap('<Leader>R', ':edit!<CR>')

-- Center search steppers
utils.nmap('n', 'nzzzv')
utils.nmap('N', 'Nzzzv')

-- Center line bumps
utils.nmap('J', 'mzJ`z')

-- Moving lines in visual mode
utils.vmap('J', [[ :m '>+1<CR>gv=gv ]])
utils.vmap('K', [[ :m '<-2<CR>gv=gv ]])

-- Use C-j and C-k to navigate page up and down
utils.nmap('<C-j>', '<C-d>')
utils.nmap('<C-k>', '<C-u>')

-- Keep hold of highlighted block when tabbing
utils.vmap('>', '>gv')
utils.vmap('<', '<gv')

-- Swap windows
utils.nmap('<Leader>S', '<C-w>r<C-w>w<CR>')
