require "nvchad.mappings"

--Function custom

local function adjust_font_size(delta)
  -- Lấy font hiện tại
  local current_font = vim.opt.guifont:get()
  local font_name, size = string.match(current_font, "([^:]+):h(%d+)")
  size = tonumber(size) + delta
  -- Cập nhật font với kích thước mới
  vim.opt.guifont = string.format("%s:h%d", font_name, size)
end
-- add yours here
local map = vim.keymap.set

-- Template Cpp
map("n", "main", "<cmd>Template main<cr>")

-- Markdown Preview
map("n", "<leader>mp", "<cmd>MarkdownPreview<cr>", { desc = "Markdown Preview" })

-- For CP, DSSA input/output file
-- map(
--   "n",
--   "<F5>",
--   ":silent! :w<CR>:!pwsh -NoExit -WindowStyle Hidden -Command 'RunCode; exit'<CR>",
--   { desc = "Run C++ File" }
-- )
-- custom
-- map("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Terminate" })
-- normal mmode
-- Save and exit
map("n", "<C-s>", ":w<CR>", { desc = "Save" })
map("i", "<C-s>", "<ESC>:w<CR>a", { desc = "Save" })
map("n", "<C-q>", ":q<CR>", { desc = "quit" })
map("n", "<leader>qq", ":qall!<CR>", { desc = "quit" })

map("n", "<C-f>", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", { desc = "format" })
-- Tmux
-- map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "windown left" })
-- map("n", "<C-l>", "<cmd> TmuxNavigateLeft<CR>", { desc = "windown right" })

-- copy/paster
-- map({ "n", "v" }, "<C-c>", '"+y', { desc = "Copy" })
-- map({ "n", "v" }, "<C-v>", '"+p', { desc = "Paster" })
map("n", "<C-a>", "gg<S-v>G", { desc = "select all" })

--- Move
map("n", "<M-Down>", "<cmd>m+<cr>", { desc = "move down" })
map("n", "<M-Up>", "<cmd>m-2<cr>", { desc = "move up" })
map("n", "<M-j>", "<cmd>m+<cr>", { desc = "move down" })
map("n", "<M-k>", "<cmd>m-2<cr>", { desc = "move up" })

-- Tab
map("n", "<leader>te", ":tabedit<Return>", { desc = "New tab buffer" })
map("n", "<leader>tn", ":tabNext<Return>", { desc = "Next tab buffer" })
map("n", "<leader>tp", ":tabprevious<Return>", { desc = "Prev tab buffer" })

-- Split window
map("n", "<C-w><left>", "<cmd>vertical resize +5<cr>", { desc = "Vertical size +5" })
map("n", "<C-w><right>", "<cmd>vertical resize -5<cr>", { desc = "Vertical size -5" })

-- rust tools
map("n", "<leader>rca", "<cmd>RustCodeActions<cr>", { desc = "Rust Code Actions" })
map("n", "<leader>rch", "<cmd>RustHoverActions<cr>", { desc = "Rust Hover Actions" })
map("n", "<leader>rcc", "<cmd>RustRunnables<cr>", { desc = "Rust Runnables" })
map("n", "<leader>rcp", "<cmd>RustOpenCargo<cr>", { desc = "Open Cargo File" })
map("n", "<leader>rcr", "<cmd>RustRun<cr>", { desc = "Rust Run" })
map("n", "<leader>rct", "<cmd>RustTest<cr>", { desc = "Rust Test" })
-- buffer
map("n", "<leader>bb", "<cmd>tabnew<cr>", { desc = "New Tab" })

-- Codedfsdf
map({ "n", "v" }, "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Actions" })

-- Size

map("n", "<M-=>", function()
  adjust_font_size(1)
end, { desc = "Arr Size" })

map("n", "<M-->", "<cmd>tabnew<cr>", { desc = "New Tab" })
