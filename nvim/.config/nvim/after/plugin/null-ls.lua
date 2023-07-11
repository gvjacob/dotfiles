local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

require("mason-null-ls").setup({
    ensure_installed = {
      "prettier",
      "jq",
      "eslint",
      "black",
    }
})

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier.with({
      extra_filetypes = { "astro", "twig" },
    }),
    null_ls.builtins.formatting.jq,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.ruff,
    null_ls.builtins.formatting.mix
  },

  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
