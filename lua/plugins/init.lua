return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
      rocks = { "magick" },
    },
  },
  -- For ui, replace input default and menu
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },

  -- -- Template
  -- {
  --   "glepnir/template.nvim",
  --   cmd = { "Template", "TemProject" },
  --   config = function()
  --     require("template").setup {
  --       temp_dir = "~/AppData/Local/nvim/lua/configs/template",
  --     }
  --   end,
  -- },
}
