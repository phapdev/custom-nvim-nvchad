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
    ["q"] = { "<cmd>q<cr>", " quit ", opts = { nowait = true } },
    ["<leader>bb"] = { "<cmd>tabnew<cr>", "new tab", opts = { nowait = true } },
    ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", "pick close ", opts = { nowait = true } },
    ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", "pick", opts = { nowait = true } },
    ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", "Sort by tabs", opts = { nowait = true} },
    -- New tab
    ["<leader>te"] = {":tabedit<Return>", "new tab buffer" , opts ={ noremap = true, nowait = true, silent = true}},
    ["<leader>tn"] = {":tabNext<Return>","Next tab buffer", opts = { noremap = true, nowait = true, silent = true}},
    ["<leader>tp"] = {":tabprev<Return>","Prev tab buffer", opts = { noremap = true, nowait = true, silent = true}},
    -- Split window
    ["<C-w><left>"] = { "<cmd>vertical resize +5<cr>","Vertical size +5", opts={nowait=true}},
    ["<C-w><right>"] = { "<cmd>vertical resize -5<cr>","Vertical size -5", opts={nowait=true}},
    -- For a more complex keymap
    ["<leader>tt"] = {
    function()
      require("base46").toggle_transparency()
    end,
      "toggle transparency",
    },
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
-- => debugger 
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    }
  }
}
-- => debugger for python
M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}



return M
