return {
    { 
        -- Rose pine theme
        "rose-pine-moon/neovim", name = "rose-pine",
        config = function()
            vim.cmd.colorscheme("rose-pine-moon")
        end,
    },
    {
        -- Status bar rose pine theme
        "maxmx03/roseline",
        opts = {},
        dependencies = {
            "rose-pine/neovim",
        }
    },
}
