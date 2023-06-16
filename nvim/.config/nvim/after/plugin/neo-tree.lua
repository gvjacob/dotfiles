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
  }
})

utils.nmap("<Leader>f", ":NeoTreeFloatToggle<CR>")
