local utils = require('utils')

local leap = require('leap')

leap.opts.case_sensitive = true

utils.map({ 'n', 'v' }, 'f', "<Plug>(leap-forward-to)")
utils.map({ 'n', 'v' }, 'F', "<Plug>(leap-backward-to)")
utils.map('n', '<C-w>f', "<Plug>(leap-from-window)")
