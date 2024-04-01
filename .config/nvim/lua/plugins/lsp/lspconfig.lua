return {
	{
		-- Mason Lspconfig
		"williamboman/mason-lspconfig.nvim",
		-- event = "BufReadPre", "BufNewFile",
		config = function()
			-- Import Mason Lspconfig
			local mason_lspconfig = require("mason-lspconfig")
			-- Configure Mason Lspconfig
			mason_lspconfig.setup({
				-- Mason Lspconfig options
				ensure_installed = {
					"html",
					"cssls",
					"lua_ls",
					"jsonls",
					"phpactor",
					"tsserver",
					"tailwindcss",
				},
			})
		end,
	},
	{
		-- Nvim Lspconfig
		"neovim/nvim-lspconfig",
		-- event = "BufReadPre", "BufNewFile",
		config = function()
			-- Import Lspconfig
			local lspconfig = require("lspconfig")

			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>f", function()
						vim.lsp.buf.format({ async = true })
					end, opts)
				end,
			})

			-- Configure Lspconfig language servers

			-- html language server
			lspconfig.html.setup({
				cmd = { "vscode-html-language-server", "--stdio" },
				filetypes = { "html" },
				init_options = {
					configurationSection = { "html", "css", "javascript" },
					embeddedLanguages = {
						css = true,
						javascript = true,
					},
				},
				root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
			})
			-- cssls language server
			lspconfig.cssls.setup({
				cmd = { "vscode-css-language-server", "--stdio" },
				filetypes = { "css", "scss" },
				root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
			})
			-- lua language server
			lspconfig.lua_ls.setup({
				cmd = { "lua-language-server" },
				filetypes = { "lua" },
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						-- format = {
						--     enable = true,
						--     defaultConfig = {
						--         indent_style = "space",
						--         indent_size = "2",
						--     },
						-- },
					},
				},
				root_dir = lspconfig.util.root_pattern(".git"),
			})
			-- json language server
			lspconfig.jsonls.setup({
				cmd = { "vscode-json-language-server", "--stdio" },
				filetypes = { "json" },
				root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
			})
			-- phpactor language server
			lspconfig.phpactor.setup({
				cmd = { "phpactor", "language-server" },
				filetypes = { "php" },
				root_dir = lspconfig.util.root_pattern("composer.json", ".git"),
			})
			-- tsserver language server
			lspconfig.tsserver.setup({
				cmd = { "typescript-language-server", "--stdio" },
				filetypes = { "javascript", "typescript" },
				root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
			})
			-- tailwindcss language server
			lspconfig.tailwindcss.setup({
				cmd = { "tailwindcss-language-server", "--stdio" },
				filetypes = { "html", "css", "scss", "javascript" },
				root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
			})
		end,
	},
}
