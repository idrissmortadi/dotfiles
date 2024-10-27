-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- This enables filetype-specific plugins and indenting
vim.cmd("filetype plugin indent on")

-- Enables syntax highlighting
vim.cmd("syntax enable")

-- Set compiler method
vim.g.vimtex_compiler_method = "latexmk"

-- Set local leader key
vim.g.maplocalleader = ","

-- Viewer options
vim.g.vimtex_view_method = "zathura"
vim.g.latex_view_general_viewer = "zathura"
vim.g.vimtex_compiler_progname = "nvr"
