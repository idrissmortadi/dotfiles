return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "nord",
				component_separators = "",
				section_separators = { left = "", right = "" },
			},
		})
	end,
}
