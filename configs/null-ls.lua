local status, null_ls = pcall(require, "null_ls")
if not status then
  return
end
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- local null_ls = require "null-ls"

-- https://github.com/nvimtools/none-ls.nvim/blob/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics


local opts = {
  sources = {
    formatting.prettier,
    formatting.gofumpt,                                                                                ---> go
    formatting.prettier.with { extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }, --> for tùm lum file luôn :))
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
return opts
