return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope-file-browser.nvim",
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
					width = 0.80,
					height = 0.80,
				},

				sorting_strategy = "ascending",
				prompt_title = { padding = { 2 } },
				prompt_prefix = "  ",
				selection_caret = "  ",
				mappings = {
					i = {
						["<C-h>"] = "which_key",
						["<C-q>"] = require("telescope.actions").close,
						["<C-j>"] = require("telescope.actions").move_selection_next,
						["<C-k>"] = require("telescope.actions").move_selection_previous,
					},
					n = { ["q"] = require("telescope.actions").close },
				},
				file_ignore_patterns = {
					"node_modules",
					"yarn.lock",
					".git",
					"_build",
					"DS_Store",
				},
				hidden = true,
			},
			-- custom picker to list buffers
			pickers = {
				buffers = {
					theme = "dropdown",
					winblend = 10,
					border = true,
					previewer = false,
					shorten_path = true,
					layout_config = {
						width = 0.25,
						height = 0.25,
						prompt_position = "top",
					},
				},
				find_files = {
					layout_config = { prompt_position = "bottom" },
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
				file_browser = {
					dir_icon = "󰉓 ",
					hidden = { file_browser = true, folder_browser = true },
				},
			},
		})

		-- load telescope extensions
		telescope.load_extension("fzf")

		-- Key mappings
		local map = require("core.util").map
		local builtin = require("telescope.builtin")
		map("n", "<leader>ff", builtin.find_files, { desc = "Find File" })
		map("n", "<leader>fB", builtin.buffers, { desc = "List Buffers" })
		map("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
		map("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
		map("n", "<leader>fr", builtin.oldfiles, { desc = "Recent Files" })
		map("n", "<leader>fb", "<cmd>Telescope file_browser initial_mode=normal<CR>", { desc = "File Browser" })
		map("n", "<leader>fc", "<cmd>Telescope file_browser path=%:p:h select_buffer=true initial_mode=normal<CR>", { desc = "Browse Current Dir" })
	end,
}
