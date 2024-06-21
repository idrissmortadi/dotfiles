return {
  -- add dracula
  {
    'catppuccin/nvim',
    lazy = false,
    priority = 1000
  },

  -- Configure LazyVim to load dracula
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}

