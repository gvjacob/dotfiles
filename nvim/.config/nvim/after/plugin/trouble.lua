require('utils')

require("trouble").setup({
  position = "bottom",
  icons = false,
  fold_open = "v", -- icon used for open folds
  fold_closed = ">", -- icon used for closed folds
  indent_lines = false, -- add an indent guide below the fold icons
  mode = "document_diagnostics",
  signs = {
    -- icons / text used for a diagnostic
    error = "error",
    warning = "warn",
    hint = "hint",
    information = "info"
  },
  use_diagnostic_signs = false
})

-- Open Trouble diagnostics
utils.nmap('<Leader>t', ':TroubleToggle<CR>')

