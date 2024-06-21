-- local status, lspconfig = pcall(require, "lspconfig")
-- if not status then
--   return
-- end

local base = require "plugins.configs.lspconfig"
local on_attach = base.on_attach
local cappabilities = base.capabilities

local protocol = require "vim.lsp.protocol"
local lspconfig = require "lspconfig"
local util = base.util
local server = {"jsonls", "markdown_oxide","tsserver","move_analyzer","gopls","cssls","html","jsonls", "eslint", "pyright" }
local async = require "lspconfig.async"

for _, lsp in ipairs(server) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    cappabilities = cappabilities,
  })
end

-- lspconfig.tailwindcss.setup {
--   on_attach = on_attach,
--   cappabilities = cappabilities,
-- }
-- -- ==> tsserver
-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   cappabilities = cappabilities,
-- }
--
--
-- -- move
-- lspconfig.move_analyzer.setup {
--   on_attach = on_attach,
--   cappabilities = cappabilities,
-- }

-- => C/C++ setup lsp
lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
  end,
  cappabilities = cappabilities,
}

-- -- => Golang
-- lspconfig.gopls.setup {
--   on_attach = on_attach,
--   cappabilities = cappabilities,
-- }


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<C-f>", vim.lsp.buf.format, opts)
  end,
})
