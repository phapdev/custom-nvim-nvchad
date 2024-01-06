local plugins = {
  {
    "nvimtools/none-ls.nvim",
    event= "VeryLazy",
    opts=function ()
      return require("custom.configs.null-ls")
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
  {
    "williamboman/mason.nvim",
    opts={
      ensure_installed ={
        "rust-analyzer", -- rust 
        "typescript-language-server",
        "tailwindcss-language-server",
        "eslint-lsp",
        "prettierd"
      }
    }
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    opts = function ()
      require("custom.configs.rust-tools")
    end,
    config = function (_, opts)
      require('rust-tools').setup(opts)
    end,
  }
}

return plugins
