return {
  -- For ui, replace input default and menu
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },

  -- Template
  {
    "glepnir/template.nvim",
    cmd = { "Template", "TemProject" },
    config = function()
      require("template").setup {
        temp_dir = "~/AppData/Local/nvim/lua/configs/template",
      }
    end,
  },

  -- Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  -- Format code
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  -- LSP server
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",

        "markdown",

        "cpp",
        "c",

        "python",

        "rust",

        "typescript",
        "javascript",
      },
    },
  },
}
