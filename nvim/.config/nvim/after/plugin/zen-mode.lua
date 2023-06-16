require('utils')

require('zen-mode').setup({
  window = {
    width = 0.8
  }
})

utils.nmap('<Leader>z', ':ZenMode<CR>')
