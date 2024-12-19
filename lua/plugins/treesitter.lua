return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    dependencies = {
      "apple/pkl-neovim",
      "windwp/nvim-ts-autotag",
    },
    build = ":TSUpdate",
    opts = function()
      return require "configs.treesitter"
    end,
    config = function(_, opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.move = {
        install_info = {
          url = "C:Users/PHAP/AppData/Local/nvim-data/tree-sitter-data/tree-sitter-move", -- local path
          files = { "src/parser.c" },
        },
      }

      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
