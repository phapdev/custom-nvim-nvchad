local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

return {
  sources = {
    null_ls.builtins.formatting.golines,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettier.with {
      filetypes = {
        "html",
        "json",
        "yaml",
        "markdown",
        "typescript.tsx",
        "typescript.jsx",
        "javascript.tsx",
        "javascript.jsx",
        "tsx",
        "jsx",
      },
    },
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
