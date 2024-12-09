return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      routes = {
        {
          filter = { event = "notify", find = "No information available" },
          opts = { skip = true },
        },
      },
      presets = {
        lsp_doc_border = true,
      },
      notify = {
        enabled = false,
      },

      lsp = {
        progress = {
          enabled = true,
        },
        signature = {
          enabled = false,
        },
        message = {
          enabled = false,
        },
      },
    },

    dependencies = {
      --         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --`nvim-notify` is only needed, if you want to use the notification view.
      --                         --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
}
