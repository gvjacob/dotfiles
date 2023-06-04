local opts = { noremap = true, silent = true }

vim.keymap.set('v', 'J', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', 'K', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', 'H', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', 'L', ':MoveHBlock(1)<CR>', opts)
