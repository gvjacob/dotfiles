local utils = require('utils')

require('neo-tree').setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  default_component_configs = {
    icon = {
      folder_empty = "?",
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
    mappings = {
      ["/"] = false,
    },
  },
  filesystem = {
    filtered_items = {
      visible = true,
      never_show = { ".DS_Store", '.git' },
    },
		window = {
			mappings = {
				["y"] = "yank_path",
			},
		},
  },
  commands = {
    yank_path = function(state)
      -- copy path of current node to unnamed register
      vim.fn.setreg('unnamedplus', state.tree:get_node().path)
    end
  },
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function()
        vim.cmd [[ setlocal relativenumber ]]
      end,
    }
  },
  sources = {
    "filesystem",
    "buffers",
    "document_symbols",
  },
})

utils.nmap("<Leader>f", ":Neotree show focus left toggle<CR>")
utils.nmap("<Leader>F", ":Neotree show focus left reveal<CR>")
