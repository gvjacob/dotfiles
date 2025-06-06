local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

require("mason-null-ls").setup({
  ensure_installed = {
    "prettier",
    "jq",
    "eslint",
    "black",
    "gofmt",
    "golangci_lint",
  },
  automatic_installation = true
})

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier.with({
      extra_filetypes = { "astro" },
    }),
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.jq,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.ruff,
    null_ls.builtins.formatting.phpcbf.with({
      command = function()
        -- Check if project has local phpcbf
        if vim.fn.executable("./vendor/bin/phpcbf") == 1 then
          return "./vendor/bin/phpcbf"

        elseif vim.fn.executable("./client-mu-plugins/vendor/bin/phpcbf") == 1 then
          return "./client-mu-plugins/vendor/bin/phpcbf"

        -- Otherwise, use global executable
        else
          return "phpcbf"
        end
      end,
    }),
    null_ls.builtins.formatting.mix.with({
      extra_filetypes = { "heex" }
    }),
    -- null_ls.builtins.formatting.djlint.with({
    --   extra_filetypes = { "twig" },
    -- })
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

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.templ" },
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local cmd = "templ fmt " .. vim.fn.shellescape(filename)

    vim.fn.jobstart(cmd, {
      on_exit = function()
        -- Reload the buffer only if it's still the current buffer
        if vim.api.nvim_get_current_buf() == bufnr then
          vim.cmd('e!')
        end
      end,
    })
  end
})

