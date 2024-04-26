return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "s1n7ax/nvim-window-picker",
    },
    event = "VeryLazy",
    -- Neotree setup
    opts = {
        open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "edgy" },
        window = { position = "right" },
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = true,
                hide_by_name = {
                    ".github",
                    ".gitignore",
                },
                never_show = {
                    ".git",
                    ".DS_Store",
                    "thumbs.db",
                },
                hide_by_pattern = { "*-lock.json" },
            },
        },
        vim.cmd([[nnoremap \ <cmd>Neotree toggle<cr>]]),
    },
}
