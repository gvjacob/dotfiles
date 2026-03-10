local utils = require('utils')

utils.map({ 'n', 'v' }, 'f', "<Plug>(leap-forward)")
utils.map({ 'n', 'v' }, 'F', "<Plug>(leap-backward)")
utils.map('n', '<C-w>f', "<Plug>(leap-from-window)")
