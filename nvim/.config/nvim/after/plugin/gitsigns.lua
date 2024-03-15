require('utils')

require('gitsigns').setup({
  current_line_blame = true
})

-- Show git diff
utils.nmap('<Leader>gd', ':Gitsigns toggle_deleted<CR>:Gitsigns toggle_word_diff<CR>', "Toggle Git diff")
utils.nmap('<Leader>gs', ':Gitsigns stage_hunk<CR>', "Stage current Git hunk")
