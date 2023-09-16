require('utils')

-- Change current word on Enter
utils.nmap('<CR>', 'ciw')

--Exit out of search
utils.nmap('<Leader>r', ':noh<CR>')

-- Refresh current buffer
utils.nmap('<Leader>R', ':edit!<CR>')

-- Center search steppers
utils.nmap('n', 'nzzzv')
utils.nmap('N', 'Nzzzv')

-- Center line bumps
utils.nmap('J', 'mzJ`z')

-- Use C-j and C-k to navigate page up and down
utils.nmap('<C-k>', '{')
utils.nmap('<C-j>', '}')
utils.vmap('<C-k>', '{')
utils.vmap('<C-j>', '}')

-- Edit .env file
utils.nmap('<Leader>e', ':e .env<CR>')

-- Step between most recent buffer
utils.nmap('<Tab>', ':b#<CR>')

-- Delete buffer
utils.nmap('<Leader>bd', ':bdelete<CR>')

-- Keep hold of highlighted block when tabbing
utils.vmap('>', '>gv')
utils.vmap('<', '<gv')

-- Swap windows
utils.nmap('<Leader>S', '<C-w>r<C-w>w<CR>')
