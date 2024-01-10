local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local opts = {
  sources = {
    null_ls.builtins.formatting.prettierd, --> for tùm lum file luôn :))
    null_ls.builtins.formatting.clang_format, --> for c/c++
    null_ls.builtins.diagnostics.mypy, --> for python: đưa ra cảnh báo code python
    null_ls.builtins.diagnostics.ruff, --> for python: đưa ra cảnh báo theo format của plugin
    null_ls.builtins.formatting.black, --> format for python 
  },
  on_attach = function (client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre",{
        group = augroup,
        buffer = bufnr,
        callback = function ()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end
}
return opts
