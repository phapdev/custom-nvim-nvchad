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
      ensure_installed = {},
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "prettierd",
        "tailwindcss-language-server", -- tailwindcss
        "typescript-language-server", -- typescript
        "rust-analyzer", -- Rust
        "lua-language-server", -- Lua
        "gopls", -- go
      },
    },
  },
  -- => Rust config
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  -- => Rust config
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  -- => setup autocloser tag
  {
    -- Yeeu cầu thiết lập treesitter ( TSInstall)
    -- example: TSInstall tsx
    "windwp/nvim-ts-autotag",
    ft = { -- giới hạn các file được tự động đóng thẻ (<tag>)
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "javascript.jsx",
      "typescript.jsx",
      "javascript.tsx",
      "typescript.tsx",
      "html",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- cầi TSInstall cho autotag
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      -- local opts = require "plugins.configs.treesitter"
      -- opts.auto_install = true -- use function
      ensure_installed = {
        -- defaults
        "vim",
        "lua",
        "vimdoc",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "markdown",

        -- low level
        "c",
        "cpp",
        "python",
        "rust",
        "go",
      },
    },
  },
  -- => git
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      vim.keymap.set("n", "<leader>gp", "<cmd> Gitsigns preview_hunk<CR>", { buffer = true })
      vim.keymap.set(
        "n",
        "<leader>gb",
        "<cmd> Gitsigns toggle_current_line_blame<CR>",
        { silent = true, buffer = true }
      )
    end,
  },
}
