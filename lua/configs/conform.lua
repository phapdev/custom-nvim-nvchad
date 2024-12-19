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
    move = { "prettier-move" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
  formatters = {
    cljfmt = {
      command = "cljfmt",
      args = { "fix", "$FILENAME" },
      stdin = false,
    },
    ["prettier-move"] = {
      command = "prettier-move",
      args = { "--stdin-filepath", "$FILENAME" },
      range_args = function(_, ctx)
        local util = require "conform.util"
        local lo, hi = util.get_offsets_from_range(ctx.buf, ctx.range)
        return {
          "--stdin-filepath",
          "$FILENAME",
          "--range-start=" .. lo,
          "--range-end=" .. hi,
        }
      end,
    },
  },
}

return options
