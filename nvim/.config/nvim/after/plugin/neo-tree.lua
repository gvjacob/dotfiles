vim.cmd [[ hi NeoTreeNormal guibg=#192230 ]]
vim.cmd [[ hi NeoTreeRootName guifg=#82B29A ]]

require('neo-tree').setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  default_component_configs = {
    icon = {
      folder_closed = "◼",
      folder_open = "▣",
      folder_empty = "◻",
      default = "*",
      highlight = "NeoTreeFileIcon"
    },
    git_status = {
      symbols = {
        untracked = "|",
        ignored   = "",
        unstaged  = "U",
        staged    = "S",
        conflict  = "=",
      }
    }
  },
  window = {
    position = "current",
    width = 30,
  },
  filesystem = {
    filtered_items = {
      visible = true,
      never_show = { ".DS_Store", '.git' }
    }
  },
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function()
        vim.cmd [[ setlocal relativenumber ]]
      end,
    }
  }
})

utils.nmap("<Leader>f", ":Neotree show focus left toggle<CR>")
utils.nmap("<Leader>F", ":Neotree show focus left reveal<CR>")
