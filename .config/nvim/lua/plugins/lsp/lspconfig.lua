return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "folke/neodev.nvim", event = "LspAttach", opts = {} },
			{ "williamboman/mason.nvim", opts = {} },
		},

		config = function()
			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Open diagnostic" })
			vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Goto previous diagnostic" })
			vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Goto next diagnostic" })
			vim.keymap.set("n", "<leader>db", vim.diagnostic.setloclist, { desc = "Buffer diagnostics" })

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover", buffer = ev.buf })
					vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename", buffer = ev.buf })
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action", buffer = ev.buf })
					vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to Definition", buffer = ev.buf })
					vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Go to Declaration", buffer = ev.buf })
					vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Go to Implementation", buffer = ev.buf })
					vim.keymap.set("n", "<leader>gr", require("telescope.builtin").lsp_references, { desc = "Go to References", buffer = ev.buf })
					-- `<leader>cf` is enabled on conform.nvim, so let's disable it here
					-- vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format", buffer = ev.buf })
				end,
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },

		config = function()
			-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
			require("neodev").setup({})

			require("mason-lspconfig").setup({
				automatic_installation = true,
				ensure_installed = { "lua_ls", "bashls", "html", "cssls", "phpactor", "tailwindcss" },
			})
			-- Automatically setup mason handlers for all lsp servers
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						on_attach = function(client, bufnr)
							require("mason").setup({
								server_name = server_name,
								client = client,
								bufnr = bufnr,
							})
						end,
					})
				end,
			})
		end,
	},
}
