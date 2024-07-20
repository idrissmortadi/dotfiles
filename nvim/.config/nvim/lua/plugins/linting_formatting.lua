return {
	{ "mfussenegger/nvim-lint" },
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
					c = { "clang-format" },
					cpp = { "clang-format" },
					javascript = { { "prettier" } },
					typescript = { { "prettier" } },
					javascriptreact = { { "prettier" } }, -- For .jsx files
					typescriptreact = { { "prettier" } }, -- For .tsx files
				},
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end,
	},
}
