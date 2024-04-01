return {
    'VonHeikemen/lsp-zero.nvim', branch = 'v3.x',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',

    config = function()
        -- import lsp_zero plugin
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
          -- see :help lsp-zero-keybindings
          -- to learn the available actions
          lsp_zero.default_keymaps({buffer = bufnr})
        end)

    end,
}
