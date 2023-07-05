require('utils')

require('gitsigns').setup({
  current_line_blame = true
})

-- Show git diff
utils.nmap(' gd', ':Gitsigns toggle_deleted<CR>:Gitsigns toggle_word_diff<CR>', "Toggle Git diff")
