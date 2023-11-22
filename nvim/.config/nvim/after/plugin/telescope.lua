require('utils')

local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

-- Search through all files tracked with git.
-- If not in a git repo, search through all files in the current directory.
local function project_files()
    vim.fn.system('git rev-parse --is-inside-work-tree')

    if vim.v.shell_error == 0 then
        builtin.git_files({ show_untracked = true })
    else
        builtin.find_files()
    end
end

-- Default configuration for all pickers
-- to use the ivy theme.
local use_ivy_theme = {
  theme = "ivy",
}

telescope.setup {
  defaults = {
    prompt_prefix = "$ ",

    mappings = {
      n = {
        ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
      },
      i = {
        ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
      },
    },
  },

  pickers = {
    git_files = use_ivy_theme,
    live_grep = use_ivy_theme,
    current_buffer_fuzzy_find = use_ivy_theme,
    find_files = use_ivy_theme,
    buffers = use_ivy_theme,
    diagnostics = use_ivy_theme,
    help_tags = use_ivy_theme,
    lsp_dynamic_workspace_symbols = use_ivy_theme,
    lsp_document_symbols = use_ivy_theme,
  },
}

telescope.load_extension('fzf')

utils.nmap('<Leader>p', project_files, "Find project file by name")

utils.nmap('<Leader>s', function ()
  builtin.live_grep({
    additional_args = function ()
      return { '--fixed-strings' }
    end,
  })
end, "Search files by text")
utils.nmap('<Leader><Leader>s', builtin.current_buffer_fuzzy_find, "Fuzzy search current buffer")

utils.nmap('<Leader>o', builtin.lsp_dynamic_workspace_symbols, "Find all symbols in workspace")
utils.nmap('<Leader><Leader>o', builtin.lsp_document_symbols, "Find all symbols in current buffer")

utils.nmap('<Leader>h', builtin.help_tags, "Search help tags")
utils.nmap('<Leader>b', builtin.buffers, "Find buffer by name")
utils.nmap('<Leader>t', builtin.diagnostics, "Find diagnostics")
utils.nmap('<Leader>gg', builtin.git_branches, "Find and switch to git branch")
