return {
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
