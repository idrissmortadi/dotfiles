return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			-- vim.o.background = "dark" -- or "light" for light mode
			vim.cmd([[colorscheme tokyonight-night]])
		end,
		opts = ...,
	},
}
-- return {
-- 	{
-- 		"ellisonleao/gruvbox.nvim",
-- 		priority = 1000,
-- 		config = function()
-- 			vim.o.background = "dark" -- or "light" for light mode
-- 			vim.cmd([[colorscheme gruvbox]])
-- 		end,
-- 		opts = ...,
-- 	},
-- }
