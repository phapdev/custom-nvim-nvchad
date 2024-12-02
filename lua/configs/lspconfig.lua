-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = {
  "clangd",
  "pyright",
  "ts_ls",
  "tailwindcss",
  "lua_ls",
  "html",
  "cssls",
  "gopls",
  "rust_analyzer",
  "jsonls",
}

local nvlsp = require "nvchad.configs.lspconfig"
-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- lsp move-mode
lspconfig.move_analyzer.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "move_analyzer" },
  filetypes = { "move" },
}
-- lsp clang-mode
lspconfig.clangd.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--offset-encoding=utf-16",
  },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  settings = {
    clangd = {
      fallbackFlags = { "-std=c++23" },
    },
  },
}
