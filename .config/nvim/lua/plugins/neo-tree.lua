---@type LazyPluginSpec
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "main",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"s1n7ax/nvim-window-picker",
	},
	-- event = "VeryLazy",
	init = function()
		vim.api.nvim_create_autocmd("BufEnter", {
			group = vim.api.nvim_create_augroup("load_neo_tree", {}),
			desc = "Loads neo-tree when openning a directory",
			callback = function(args)
				local stats = vim.uv.fs_stat(args.file)

				if not stats or stats.type ~= "directory" then
					return
				end

				require("neo-tree")

				return true
			end,
		})
	end,
	-- Neotree setup
	opts = {
		open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "edgy" },
		window = { position = "right" },
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = true,
				hide_by_name = {
					".github",
					".gitignore",
				},
				never_show = {
					".git",
					".DS_Store",
					"thumbs.db",
				},
				hide_by_pattern = { "*-lock.json" },
			},
		},
		-- vim.cmd([[nnoremap \ <cmd>Neotree toggle<cr>]]),
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)
		vim.api.nvim_create_augroup("load_neo_tree", {})
	end,
	keys = {
		{ "\\", "<cmd>Neotree toggle<cr>", desc = "Neo-tree toggle" },
	},
}
