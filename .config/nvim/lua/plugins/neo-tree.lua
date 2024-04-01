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
    -- optional = true,
    keys = {
        { "<leader>w", ":Neotree focus<CR>", silent = true, desc = "File Explorer" },
    },
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

        -- git_status = {
        --     symbols = {
        --         -- Change type
        --         added = icons.git.added,
        --         deleted = icons.git.deleted,
        --         modified = icons.git.modified,
        --         renamed = icons.git.renamed,
        --         -- Status type
        --         untracked = icons.git.untracked,
        --         ignored = icons.git.ignored,
        --         unstaged = icons.git.Unstaged,
        --         staged = icons.git.staged,
        --         conflict = icons.git.conflict,
        --     },
        -- },

        buffers = {
            follow_current_file = {
                enabled = true,
            },
        },
        event_handlers = {
            ["BufEnter"] = "focus",
            ["WinEnter"] = "focus",
            ["BufLeave"] = "close",
            ["WinLeave"] = "close",
        },
    },
}
