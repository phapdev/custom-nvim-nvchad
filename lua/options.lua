require "nvchad.options"

local o = vim.o
o.cursorlineopt = "both"
o.relativenumber = true
o.laststatus = 3
o.tabstop = 2 -- A TAB character looks like 4 spaces
o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
o.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
o.shiftwidth = 2 -- Number of spaces inserted when indenting
-- Enable mouse mode
o.mouse = "a"
-- Enable break indent
o.breakindent = true
--
-- -- Save undo history
o.undofile = true
--
-- -- Case-insensitive searching UNLESS \C or capital in search
o.ignorecase = true
o.smartcase = true
--
-- -- Keep signcolumn on by default
o.signcolumn = "yes"
--
-- -- Decrease update time
o.updatetime = 250
o.timeoutlen = 300
--
-- -- Set completeopt to have a better completion experience
o.completeopt = "menuone,noselect"
--
-- -- Set terminal gui colors to true
o.termguicolors = true
