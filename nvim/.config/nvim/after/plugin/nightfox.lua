require("nightfox").setup({
  options = {
    styles = {
      comments = "italic"
    }
  },
  palettes = {
    terafox = {
      bg1 = "#001610"
    },
    nightfox = {
      bg1 = "#011627"
    }
  }
})

-- Set colorscheme
vim.cmd [[ colorscheme nightfox ]]

-- Load the default highlight group for Neo-tree root name
-- and override specific values.
local palette = require('nightfox.palette').load('nightfox')
local neo_tree_root_hl = vim.api.nvim_get_hl_by_name("NeoTreeRootName", true)
neo_tree_root_hl.foreground = palette.green.base

-- Override the highlight groups.
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg=palette.bg1 })
vim.api.nvim_set_hl(0, "NeoTreeRootName", neo_tree_root_hl)
