return {
	"dharmx/track.nvim",
	opts = function()
		require("track").setup({
			pickers = {
				-- initialize pickers on normal mode
				bundles = { initial_mode = "normal" },
				views = { initial_mode = "normal" },
			},
		})

		-- mappings
		local map = require("core.util").map
		map("n", "<leader><leader>", "<cmd>Track<cr>", { desc = "Track" })
		map("n", "<leader>tb", "<cmd>Track bundles<cr>", { desc = "Track bundles" })
		map("n", "<leader>tm", "<cmd>Mark<cr>", { desc = "Mark file" })
		map("n", "<leader>tu", "<cmd>Unmark<cr>", { desc = "Unmark file" })
	end,
}
