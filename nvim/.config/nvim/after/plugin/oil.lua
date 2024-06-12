require('utils')

require("oil").setup({
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name)
      if name:match(".DS_Store") then
        return true
      end

      if name:match(".git") then
        return true
      end

      return false
    end
  }
})

utils.nmap("<Leader>f", ":Oil<CR>")
utils.nmap("<Leader>F", ":Oil<CR>")
