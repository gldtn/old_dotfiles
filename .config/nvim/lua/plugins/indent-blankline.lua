return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { 'BufReadPre', 'BufNewFile' },

    config = function()
        -- import indent-blankline plugin
        local ibl = require("ibl")

        -- configure indent-blankline
        ibl.setup({
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = { enabled = false },
            exclude = {
                filetypes = {
                    "dashboard",
                },
            },
        })
    end,
}
