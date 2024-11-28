require("trouble").setup({
  position = "bottom",
  icons = false,
  fold_open = "v", -- icon used for open folds
  fold_closed = ">", -- icon used for closed folds
  indent_lines = false, -- add an indent guide below the fold icons
  mode = "document_diagnostics",
  use_diagnostic_signs = false
})
