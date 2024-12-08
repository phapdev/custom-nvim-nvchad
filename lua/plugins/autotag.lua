return {
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
      ".tsx",
      ".jsx",
      "html",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
