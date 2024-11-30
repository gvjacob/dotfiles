local utils = require('utils')

utils.map({ 'n', 'v' }, 'f', "<Plug>(leap-forward-to)")
utils.map({ 'n', 'v' }, 'F', "<Plug>(leap-backward-to)")
utils.map('n', '<C-w>f', "<Plug>(leap-from-window)")
