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
