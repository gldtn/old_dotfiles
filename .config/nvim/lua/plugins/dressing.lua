return {
    "stevearc/dressing.nvim",
    event = "VeryLazy",

    config = function()
        -- Require Dressing
        local dressing = require("dressing")

        dressing.setup({
            -- Options will go here
        })
    end,
}
