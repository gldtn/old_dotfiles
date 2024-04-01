return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			cond = vim.fn.executable("cmake") == 1,
		},
	},

	config = function()
		-- import telescope plugin
		local telescope = require("telescope")

		-- configure telescope
		telescope.setup({
			defaults = {
				layout_config = {
					prompt_position = "top",
					preview_cutoff = 120,
					width = 0.75,
					height = 0.75,
				},
				sorting_strategy = "ascending",
				mappings = {
					i = {
						["<esc>"] = require("telescope.actions").close,
					},
				},
				file_ignore_patterns = {
					"node_modules",
					"yarn.lock",
					".git",
					".sl",
					"_build",
					"DS_Store",
				},
				hidden = true,
			},
			pickers = {
				-- Default configuration for builtin pickers goes here:
				buffers = {
					theme = "dropdown",
					winblend = 10,
					border = true,
					previewer = false,
					shorten_path = true,
					layout_config = {
						width = 0.25,
						height = 0.25,
					},
				},
				find_files = {
					prompt_position = "bottom",
					prompt_title = "Find Files",
					-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},
			extensions = {
				fzf = {
					override_generic_sorter = false,
					override_file_sorter = true,
				},
			},
		})

		-- load telescope extensions
		telescope.load_extension("fzf")

		-- Key mappings
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
	end,
}
