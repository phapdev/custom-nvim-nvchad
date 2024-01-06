---@type MappingsTable
local M = {}

M.general = {
  n = {
    --noh: 
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- copy - paster - select all
    ["<C-a>"] = { "gg<S-v>G", "Select all", opts = { silent = true } },
    ["<c-c>"] = { '"+y', "copy", opts = { nowait = true } },
    ["<c-v>"] = { '"+p', "paster", opts = { nowait = true } },
    ["<S-Down>"] = { "<cmd>t.<cr>", " ", opts = { nowait = true } },
    ["<S-Up>"] = { "<cmd>t -1<cr>", " ", opts = { nowait = true } },
    ["<M-J>"] = { "<cmd>t.<cr>", " ", opts = { nowait = true } },
    ["<M-K>"] = { "<cmd>t -1<cr>", " ", opts = { nowait = true } },
    -- Move
    ["<M-Down>"] = { "<cmd>m+<cr>", " ", opts = { nowait = true } },
    ["<M-Up>"] = { "<cmd>m-2<cr>", " ", opts = { nowait = true } },
    ["<M-j>"] = { "<cmd>m+<cr>", " ", opts = { nowait = true } },
    ["<M-k>"] = { "<cmd>m-2<cr>", " ", opts = { nowait = true } },
    -- formater
    ["<C-f>"] = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", " ", opts = { nowait = true } },
    ["q"] = { "<cmd>q<cr>", " ", opts = { nowait = true } },
    ["<leader>bb"] = { "<cmd>tabnew<cr>", " ", opts = { nowait = true } },
    ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", " ", opts = { nowait = true } },
    ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", " ", opts = { nowait = true } },
    ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", " ", opts = { nowait = true } },
    -- Split windown
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["<A-j>"] = { ":m .+1<CR>==", "Alt up ", opts = { nowait = true } },
    ["<A-k>"] = { ":m .-2<CR>==", "Alt down", opts = { nowait = true } },
    ["p"] = { '"_dP', " ", opts = { nowait = true } },
    ["<c-c>"] = { '"+y', "coppy", opts = { nowait = true } },
    ["<c-v>"] = { '"+p', "paster", opts = { nowait = true } },
  },
  i = {
    ["<S-Down>"] = { "<cmd>t.<cr>", " ", opts = { nowait = true } },
    ["<M-Down>"] = { "<cmd>m+<cr>", " ", opts = { nowait = true } },
    ["<S-Up>"] = { "<cmd>t -1<cr>", " ", opts = { nowait = true } },
    ["<M-Up>"] = { "<cmd>m-2<cr>", " ", opts = { nowait = true } },
    ["<C-s>"] = { "<cmd>w<cr>", " ", opts = { nowait = true } },
    -- ["<C-l>"] = { "<cmd>LiveServer start<cr><cr>", " ", opts = { nowait = true }},
    ["<C-f>"] = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", " ", opts = { nowait = true } },
  },
}

-- more keybinds!

return M
