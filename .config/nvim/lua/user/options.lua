-- Enable relative line numbers 
vim.opt.number = true
vim.opt.relativenumber = true

-- Better scrolling
vim.opt.scrolloff = 999

-- Better term colors (24-bit)
vim.opt.termguicolors = true

-- Better splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Disable text wrap
vim.opt.wrap = false

-- Set tabs/ident to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Synchronizes the system clipboard with Neovim's clipboard.
vim.opt.clipboard = "unnamedplus"

-- Enable cursor line highlight
vim.opt.cursorline = true

-- Set highlight to block
vim.opt.virtualedit = "block"

-- Split search editing?
vim.opt.inccommand = "split"

-- Enable mouse mode
vim.opt.mouse = "a"

-- Ignore case/better searching
vim.opt.ignorecase = true

-- Set leader key to space
vim.g.mapleader = " "
