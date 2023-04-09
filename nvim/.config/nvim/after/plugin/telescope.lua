require('utils')

local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

local function project_files()
    vim.fn.system('git rev-parse --is-inside-work-tree')

    if vim.v.shell_error == 0 then
        builtin.git_files({ show_untracked = true })
    else
        builtin.find_files()
    end
end

telescope.setup {
  defaults = {
    prompt_prefix = "$ ",

    mappings = {
      n = {
        ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
      },
    },
  },

  pickers = {
    git_files = {
      theme = "ivy",
    },
    live_grep = {
      theme = "ivy",
    },
    current_buffer_fuzzy_find = {
      theme = "ivy",
    },
    find_files = {
      theme = "ivy",
    },
    buffers = {
      theme = "ivy",
    },
    diagnostics = {
      theme = "ivy",
    }
  },
}

telescope.load_extension('fzf')

vim.keymap.set('n', '<Leader>p', project_files, {})
vim.keymap.set('n', '<Leader>s', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>b', builtin.buffers, {})
vim.keymap.set('n', '<Leader>/', builtin.current_buffer_fuzzy_find, {})
