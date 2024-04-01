return {
    "rmagatti/auto-session",

    config = function()
        -- import auto-session plugin
        local auto_session = require("auto-session")

        -- configure auto-session
        auto_session.setup {
            log_level = vim.log.levels.ERROR,
            auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            auto_session_enabled = false,
            auto_session_use_git_branch = false,
            auto_session_enable_last_session = false,

            -- Telescope session lens
            session_lens = {
                buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
                load_on_setup = true,
                theme_conf = { border = true },
                previewer = false,
            },

            -- Set mapping for searching a session.
            vim.keymap.set("n", "<Leader>ls", require("auto-session.session-lens").search_session, { noremap = true, })
        }
    end,
}
