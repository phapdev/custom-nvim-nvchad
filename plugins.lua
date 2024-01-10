local plugins = {
  -- => setup lsp language server
  -- => none-ls
  {
    "nvimtools/none-ls.nvim",
    event= "VeryLazy",
    opts=function ()
      return require("custom.configs.null-ls")
    end
  },
  -- -- => null-ls
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   event= "VeryLazy",
  --   opts = function ()
  --     return require("custom.configs.null-ls")
  --   end
  -- },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
  -- => Setup language for lsp 
  {
    "williamboman/mason.nvim",
    opts={
      ensure_installed ={
        "rust-analyzer", -- rust 
        "typescript-language-server", -- typescript
        "tailwindcss-language-server", -- tailwindcss
        "eslint-lsp", -- eslinter
        "prettierd", -- style code 
        "cland", -- C/C++ 
        "clang-format", -- format code for C/C++
        "codelldb", -- debuger for C/C++
        "pyright", -- Python
        "ruff", -- Python
        "mypy", -- Python
        "black", -- format code python
        "debugpy", --debuger for python
      }
    }
  },
  -- => Rust config
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end,
  },
  -- => Rust config
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    opts = function ()
      require("custom.configs.rust-tools")
    end,
    config = function (_, opts)
      require('rust-tools').setup(opts)
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
      "html"
    },
    config = function ()
      require("nvim-ts-autotag").setup()
    end
  },
  -- cầi TSInstall cho autotag 
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      opts = require("plugins.configs.treesitter")
      opts.ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "rust",
        "cpp"
      }
    return opts
    end,
  },
  -- => End treesitter and config autotag
  -- => chat GPT 
  {
    "dreamsofcode-io/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies ={
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    config = function ()
      require("chatgpt").setup({
        async_api_key_cmd = "pass show api/tokens/openai",
      })
    end
  },
  -- => End chatgpt
  -- => Setup Debuger 
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",

    },
    opts = {
      handlers = {},
    }
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings("dap")
    end
  },
  -- =>> Debuger for python 
  {
    "mfussenegger/nvim-dap-python",
    ft="python",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap",
    },
    config = function (_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  -- =>> UI debuger 
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  }
}

return plugins
