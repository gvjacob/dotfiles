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
    }
  },
  window = {
    position = "current",
  },
  filesystem = {
    filtered_items = {
      visible = true,
      never_show = { ".DS_Store" }
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

utils.nmap("<Leader>f", ":NeoTreeFloatToggle<CR>")
