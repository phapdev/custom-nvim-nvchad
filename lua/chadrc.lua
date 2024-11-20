-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options 🚀

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "nightowl",
  -- transparency = true,

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.nvdash = {
  load_on_startup = true,
}

M.ui = {
  cmp = {
    style = "flat_dark",
  },

  telescope = {
    style = "borderless",
  },
}
M.term = {
  winopts = { number = false, relativenumber = false },
  sizes = { sp = 0.5, vsp = 0.5, ["bo sp"] = 0.5, ["bo vsp"] = 0.5 },
  float = {
    relative = "editor",
    row = 0.05,
    col = 0.10,
    width = 0.8,
    height = 0.8,
    border = "single",
  },
}

return M
