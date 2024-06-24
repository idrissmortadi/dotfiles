return {
  -- add dracula
  {
   'Mofiqul/dracula.nvim',
    lazy = false,
    priority = 1000
  },

  -- Configure LazyVim to load dracula
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}

