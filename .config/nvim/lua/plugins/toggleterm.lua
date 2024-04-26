return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	opts = {
		size = 20,
		open_mapping = [[<C-/>]],
		hide_numbers = true,
		shade_filetypes = {},
		shade_terminals = true,
		-- shading_factor = "1",
		start_in_insert = true,
		insert_mappings = true,
		persist_size = true,
		direction = "float",
		close_on_exit = true,
		shell = vim.o.shell,
		float_opts = {
			border = "curved",
			winblend = 0,
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},

		config = function(_, opts)
			-- local colors = require("tokyonight.colors").setup()
			local toggleterm = require("toggleterm")
			toggleterm.setup({
				-- shade_terminals = false,
				-- highlights = {
				--     Normal = {
				--         guibg = colors.bg_dark
				--     }
				-- },
			}, opts)
		end,
	},
}
