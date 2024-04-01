return {
    "echasnovski/mini.indentscope",
    version = false,
    event = { 'BufReadPre', 'BufNewFile' },

    config = function()
        -- import mini plugin
        local mini = require("mini.indentscope")

        -- configure mini
        mini.setup({
            symbol = "│",
            options = { try_as_border = true },
        })
    end,
}
