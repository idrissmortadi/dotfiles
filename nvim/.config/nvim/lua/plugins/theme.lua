return {
	{
		"catppuccin/nvim",
		--"folke/tokyonight.nvim",
		-- "Mofiqul/dracula.nvim",
		lazy = false,
		priority = 1000,
	},

	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin-mocha",
			-- colorscheme = "dracula",
			-- colorscheme = "tokyonight-night",
		},
	},
}
