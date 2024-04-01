return {
    "folke/which-key.nvim",
    event = "VeryLazy",

    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500

        -- import which-key plugin
        local wk = require("which-key")

        -- configure which-key
        wk.setup({
            window = {
                border = "single",        -- none, single, double, shadow
                position = "bottom",      -- bottom, top
                margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
                padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
                winblend = 0,             -- value between 0-100 0 for fully opaque and 100 for fully transparent
                zindex = 1000,            -- positive value to position WhichKey above other floating windows.
            },
        })

        -- define options
        local opts = {
            mode = "n",
            prefix = "<leader>",
            buffer = nil,
            silent = true,
            noremap = true,
            nowait = false,
        }

        -- define mappings
        local mappings = {
            f = {
                name = "file",
                f = { "<cmd>Telescope find_files<cr>", "Find File" },
                r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
                n = { "<cmd>enew<cr>", "New File" },
            },
            ["/"] = {
                name = "comment",
                ["c"] = { "gcc", "Line comment", remap = true },
                ["b"] = { "gbc", "Line comment", remap = true },
                ["p"] = { "gcip", "Paragraph comment", remap = true },
            },
        }

        -- load config
        wk.register(mappings, opts)
    end,
}
