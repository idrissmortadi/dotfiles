vim.cmd("set expandtab") -- Use spaces instead of tabs for indentation
vim.cmd("set tabstop=2") -- Set the width of a tab character to 2 spaces
vim.cmd("set softtabstop=2") -- Set the number of spaces that a <Tab> counts for in insert mode
vim.cmd("set shiftwidth=2") -- Set the number of spaces to use for each step of (auto)indent
vim.cmd("set relativenumber") -- Show line numbers relative to the current line
vim.cmd("set number") -- Show absolute line number of the current line
vim.cmd("set clipboard^=unnamed,unnamedplus") -- Use system clipboard for yank, delete, change, and put operations

-- Auto-pair double quotes and place the cursor between them
vim.cmd('inoremap " ""<left>')

-- Auto-pair single quotes and place the cursor between them
vim.cmd("inoremap ' ''<left>")

-- Auto-pair parentheses and place the cursor between them
vim.cmd("inoremap ( ()<left>")

-- Auto-pair square brackets and place the cursor between them
vim.cmd("inoremap [ []<left>")

-- Auto-pair curly braces and place the cursor between them
vim.cmd("inoremap { {}<left>")

-- When typing '{' followed by Enter, auto-format to place closing brace on the next line, with cursor between the braces
vim.cmd("inoremap {<CR> {<CR>}<ESC>O")

-- When typing '{' followed by Enter, auto-format to place closing brace and semicolon on the next line, with cursor between the braces
vim.cmd("inoremap {;<CR> {<CR>};<ESC>O")

-- Automatically add a semicolon at the end of the line and stay in insert mode
vim.cmd("inoremap ;; <Esc>A;<Esc>i")
