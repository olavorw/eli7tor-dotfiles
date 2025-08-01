-- Set <space> as the leader key
-- This is a common convention in Neovim
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set path to the plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Auto-install lazy.nvim if it's not already installed
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim with our list of plugins
require("lazy").setup({
  -- A popular, beautiful colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure it loads first
    priority = 1000,
    config = function()
      -- Load the colorscheme
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  -- A file explorer tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
      "MunifTanjim/nui.nvim",
    },
    config = function()
      -- Open the file explorer with <leader>e (Spacebar + e)
      vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { silent = true })
    end,
  },

  -- A fancy statusline at the bottom
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end,
  },
})
