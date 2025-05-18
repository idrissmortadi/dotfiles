-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Quick chat keybinding
vim.keymap.set("n", "<leader>ab", function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, {
      selection = require("CopilotChat.select").buffer,
    })
  end
end, { desc = "Current Buffer Quick Chat" })

vim.keymap.set({ "n", "v" }, "<leader>as", function()
  local input = vim.fn.input("Perplexity: ")
  if input ~= "" then
    require("CopilotChat").ask(input, {
      agent = "perplexityai",
      selection = false,
    })
  end
end, { desc = "Perplexity Search" })
