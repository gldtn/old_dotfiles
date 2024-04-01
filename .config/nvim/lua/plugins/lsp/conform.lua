return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = { "ConformInfo" },
	dependencies = {
		"rcarriga/nvim-notify",
	},

	config = function()
		-- import conform
		local conform = require("conform")

		-- conform configuration
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				python = { "isort", "black" },
			},
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
			keys = {
				{
					-- Customize or remove this keymap to your liking
					"<leader>f",
					function()
						conform.format({ async = true, lsp_fallback = true })
						vim.notify("test", "info", { title = "title" })
					end,
					mode = "",
					desc = "Format buffer",
				},
			},
		})
	end,
}
