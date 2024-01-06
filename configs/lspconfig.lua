local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local cappabilities = base.capabilities

local lspconfig = require("lspconfig")

local server = {"tsserver","tailwindcss","eslint"}

for _, lsp in ipairs(server) do
  lspconfig[lsp].setup({
    on_attach=on_attach,
    cappabilities=cappabilities,
  })
end
