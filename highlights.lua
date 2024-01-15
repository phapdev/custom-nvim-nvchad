-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
  -- <mau menu <cmd>
  -- Pmenu = { bg = "white" },
      -- Pmenu= { bg = "#ffffff" }, this works too
      -- if you want to lighten or darken color
      -- this will use the black colorf rom nvchad theme & lighten it by 2x
      -- use a negative number to darken it
      Normal = {
        -- bg = {"black", 2}
      },
  -- status line color
  St_LspStatus= {
    -- bg="red",
    fg = "grey"
  }
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "sun", bold = true },
}

return M
