return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			cmdline = {
				view = "cmdline",
			},
		})
    -- stylua: ignore
    require("notify").setup({
      stages = "fade",
      timeout = 3000,
      top_down = false,
      render = "compact",
    })
	end,
}
