-- ------------------------------------------------
-- [[ Keymaps Settings ]] --
-- ------------------------------------------------
--  See `:help vim.keymap.set()`

-- Shorten `vim.keymap.set` function to `Map`,
local map = require("core.util").map

-- Modes (normal, insert, visual)
local modes = { "n", "i", "v", "x" }

-- Leader key, remap to space
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ------------------------------------------------
-- [[ Keymaps ]] --
-- ------------------------------------------------
-- a good part of these keymaps was stolen from Lazyvim.

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Close Buffer" })
map("n", "<C-q>", "<cmd>bd<cr>", { desc = "Close Buffer" })

-- Yank lines
-- map("n", "Y", "y$<CR>", { desc = "Yank to end of line" })
-- map("n", "P", "<cmd>pu!<CR>", { desc = "Paste before cursor" })
-- map("n", "p", "<cmd>pu<CR>", { desc = "Paste after cursor" })

-- Select all
map("n", "<C-a>", "gg0VG$", { desc = "Select all" })

-- Better identing; stay in indent mode
map("v", "<", "<gv^")
map("v", ">", ">gv^")

-- ------------------------------------------------
-- [[ Misc/Experimental ]]
-- ------------------------------------------------

-- Comments
for _, mode in ipairs(modes) do
    map(mode, "<C-c>", "gcc", { remap = true, desc = "Line comment" })
    map(mode, "<C-b>", "gbc", { remap = true, desc = "Block comment" })
    map(mode, "<C-p>", "gcip", { remap = true, desc = "Paragraph comment" })
end

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
