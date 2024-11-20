require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

-- Template Cpp
map("n", "main", "<cmd>Template main<cr>")

-- Markdown Preview
map("n", "<leader>mp", "<cmd>MarkdownPreview<cr>", { desc = "Markdown Preview" })

-- Copy to clipboard
map("v", "<C-c>", '"+y', { desc = "Copy to yanked" })

map("n", "<C-c>", '"+y', { desc = "Copy to yanked" })
-- For CP, DSA input/output file
map(
  "n",
  "<F5>",
  ":silent! :w<CR>:!pwsh -NoExit -WindowStyle Hidden -Command 'RunCode; exit'<CR>",
  { desc = "Run C++ File" }
)

-- custom
-- noh
map("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Terminate" })
-- normal mmode
-- Save and exit
map("n", "<C-s>", ":w<CR>", { desc = "Save" })
map("i", "<C-s>", "<ESC>:w<CR>a", { desc = "Save" })
map("n", "<C-q>", ":q<CR>", { desc = "quit" })
map("n", "<leader>qq", ":qall!<CR>", { desc = "quit" })

map("n", "<C-f>", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", { desc = "format" })
-- Tmux
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "windown left" })

-- copy/paster
map("n", "<C-c>", '"+y', { desc = "Copy" })
map("n", "<C-v>", '"+p', { desc = "Paster" })
