return {
  {
    "williamboman/mason.nvim", opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      automatic_installation = true,
      ensure_installed = { "lua_ls", "html", "cssls", "phpactor", "tailwindcss" },
    },
  },
  {
    -- Nvim Lspconfig
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim"
    },
    config = function()
      -- Require lspconfig
      local lspconfig = require("lspconfig")

      -- Lsp servers
      lspconfig.phpactor.setup({})

      -- Lua
      require("neodev").setup()
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
            diagnostics = {
              -- globals = { "vim" },
            },
          },
        },
      })
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

          -- Shorten `vim.keymap.set` function to `Map`,
          -- Allow setting a description for the mapping
          local function map(modes, lhs, rhs, opts)
            local options = { buffer = ev.buf }
            if opts then
              options = vim.tbl_extend("force", options, opts)
            end
            vim.keymap.set(modes, lhs, rhs, options)
          end

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
          map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
          map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
          map("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
          map("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
          map("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
          map("n", "<leader>gr", require("telescope.builtin").lsp_references, { desc = "Go to References" })
          -- `<leader>cf` is enabled on conform.nvim, so let's disable it here
          -- map("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format" })
        end,
      })
    end,
  },
}
