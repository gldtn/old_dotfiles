-- lazy.nvim plugin manager

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- setup
require("lazy").setup({
    { 
        -- rose-pine-theme
        -- https://github.com/rose-pine/neovim
        "rose-pine/neovim", name = "rose-pine",
        config = function()
            -- Set colorscheme after options
            vim.cmd("colorscheme rose-pine-moon")
        end,
    },
    {
        -- nvim-treesitter
        -- https://github.com/nvim-treesitter/nvim-treesitter/tree/master
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { 
                    "c", "lua", "vim", "vimdoc", "query", 
                    "bash", 
                    "gitignore", 
                    "html", 
                    "javascript", 
                    "jq",
                    "json",
                    "jsonc",
                    "markdown",
                    "markdown_inline",
                    "php",
                    "python",
                    "rust",
                    "scss",
                    "sql",
                    "ssh_config",
                    "swift",
                    "toml",
                    "xml",
                    "yaml",
                },

                auto_install = true,
             
                highlight = {
                    enable = true,
                },
            })
        end,
    },
})
