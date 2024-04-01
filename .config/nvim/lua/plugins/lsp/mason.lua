return {
    "williamboman/mason.nvim",
    config = function()
        -- Import Mason
        local mason = require("mason")
        -- Configure Mason
        mason.setup({
            autostart = true,
            autostart_filetypes = {
                "c",
                "sh",
                "zsh",
                "lua",
                "vim",
                "css",
                "scss",
                "bash",
                "rust",
                "java",
                "json",
                "yaml",
                "toml",
                "html",
                "python",
                "markdown",
                "javascript",
            },
        })
    end,
}

