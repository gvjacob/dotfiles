local utils = require('utils')

-- Change current word on Enter
utils.nmap('<CR>', 'ciw')

-- utils.nmap('<Leader>r', ':noh<CR>')

-- Move cursor to start or end of line
utils.nmap('H', '^')
utils.nmap('L', '$')

-- Refresh current buffer
utils.nmap('<Leader>R', ':edit!<CR>')

-- Center search steppers
utils.nmap('n', 'nzzzv')
utils.nmap('N', 'Nzzzv')

-- Center line bumps
utils.nmap('J', 'mzJ`z')

-- Toggle between last two buffers
utils.nmap('<Tab>', ':b#<CR>')

-- Keep hold of highlighted block when tabbing
utils.vmap('>', '>gv')
utils.vmap('<', '<gv')

-- Edit .env file
utils.nmap('<Leader>e', ':e .env<CR>')

