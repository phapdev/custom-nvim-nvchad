local options = {
  formatters_by_ft = {
    lua = { "stylua" },

    markdown = { "prettier" },
    typescript = { "prettier" },
    javascript = { "prettier" },

    c_cpp = { "clang-format" },
    cpp = { "clang-format" },
    c = { "clang-format" },

    python = { "black" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
