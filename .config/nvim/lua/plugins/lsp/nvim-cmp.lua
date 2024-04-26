return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- Auto-completion sources
    "neovim/nvim-lspconfig", -- LSP client for nvim
    "hrsh7th/cmp-nvim-lsp",  -- LSP source for nvim-cmp
    "hrsh7th/cmp-cmdline",   -- source for the command line
    "hrsh7th/cmp-buffer",    -- source for the text in buffer
    "hrsh7th/cmp-path",      -- source files system paths

    -- Extra sources
    "ray-x/cmp-treesitter",   -- treesitter source for nvim-cmp
    "zbirenbaum/copilot-cmp", -- copilot source for nvim-cmp

    -- Snippets
    "L3MON4D3/LuaSnip",             -- snippets engine
    "saadparwaiz1/cmp_luasnip",     -- auto-completion of snippets
    "rafamadriz/friendly-snippets", -- collection of snippets

    -- Icons
    "onsails/lspkind-nvim", -- icons for the popup menu
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = {
        ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
        ["<ESC>"] = cmp.mapping.close(),
      },
      sources = cmp.config.sources({
        { name = "copilot",    group_index = 2 },
        { name = "nvim_lsp",   group_index = 2 },
        { name = "luasnip",    group_index = 2 },
        { name = "treesitter", group_index = 2 },
        { name = "buffer" },
      }),
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol', -- show only symbol annotations
          maxwidth = 50, -- prevent the popup from showing more than provided characters
          ellipsis_char = '...', -- truncate text from exceeding maxwidth w/ ellipssis
          show_labelDetails = true, -- show labelDetails in menu.
          symbol_map = { Copilot = "" }, -- custom symbol for copilot
        })
      },
      -- Setup lspconfig
      require("lspconfig")["phpactor"].setup({ capabilities = capabilities })
    })
  end,
}
