local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local cappabilities = base.capabilities

local lspconfig = require("lspconfig")

local server = {"tsserver","tailwindcss","eslint", "pyright"}

for _, lsp in ipairs(server) do
  lspconfig[lsp].setup({
    on_attach=on_attach,
    cappabilities=cappabilities,
  })
end
-- => C/C++ setup lsp
lspconfig.clangd.setup({
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
  end,
  cappabilities = cappabilities,
})
