vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"

-- Set leader key for convenience
vim.g.mapleader = " "

-- Lazy.nvim setup
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- Auto commands
-- Disable line numbers for .txt files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.txt",
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false
  end,
})

-- Set shell and shell options for Windows
if vim.fn.has "win32" == 1 then
  vim.opt.shell = "pwsh"
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
  vim.opt.shellxquote = ""
  vim.opt.shellquote = ""
  vim.opt.shellpipe = "| Out-File -Encoding UTF8 %s"
  vim.opt.shellredir = "| Out-File -Encoding UTF8 %s"
end

-- Neovide-specific settings for better UI experience on Windows
if vim.g.neovide then
  vim.g.neovide_antialiasing = true
  vim.g.neovide_clear_type = true
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_cursor_vfx_opacity = 250
  vim.g.neovide_cursor_vfx_particle_density = 10.0
  vim.g.neovide_cursor_vfx_particle_lifetime = 0.8
  vim.g.neovide_cursor_vfx_type = "wave"
  vim.g.neovide_fullscreen = false
  vim.g.neovide_max_fps = 120
  vim.g.remember_window_position = true
  vim.g.remember_window_size = true
  vim.opt.guifont = "FiraCode Nerd Font:h14"
  vim.g.neovide_floating_corner_radius = 1.0
  vim.g.neovide_scroll_animation_length = 0.2
  vim.g.neovide_profiler = false -- check fps/gpu/cpu

  local function toggle_transparency()
    vim.g.neovide_transparency = (vim.g.neovide_transparency == 1.0) and 0.8 or 1.0
  end

  local function toggle_fullscreen()
    vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
  end

  vim.keymap.set("n", "<F11>", toggle_fullscreen, { silent = true })
  vim.keymap.set("n", "<F10>", toggle_transparency, { silent = true })
end

local lazy_config = require "configs.lazy"
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  { import = "plugins" },
}, lazy_config)

dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
