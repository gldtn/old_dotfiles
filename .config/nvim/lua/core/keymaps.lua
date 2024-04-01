-- ------------------------------------------------
-- [[ Keymaps ]] --
-- ------------------------------------------------
--  See `:help vim.keymap.set()`

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- ------------------------------------------------
-- Shorten `vim.keymap.set` function to `Map`,
-- Set `noremap` to true, and set the output to silent.
-- ------------------------------------------------
function Map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- ------------------------------------------------
-- Leader key, remap to space
-- ------------------------------------------------
Map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ------------------------------------------------
-- [[ Normal ]] --
-- ------------------------------------------------

-- Save file
Map("n", "<C-s>", ":w<CR>", { desc = "Save file" })
Map("n", "<Leader-s>", "<cmd>w<CR>:lua require('notify')('File saved!', 'info')<CR>", { desc = "Save file" })
Map("n", "<C-q>", ":bd<CR><CR>", { desc = "Close buffer" })
Map("n", "<S-p>", "<cmd>Telescope buffers<CR>", { desc = "List buffers" })

-- Better window navigation
Map("n", "<C-h>", "<C-w>h")
Map("n", "<C-j>", "<C-w>j")
Map("n", "<C-k>", "<C-w>k")
Map("n", "<C-l>", "<C-w>l")

-- Resize with arrows
Map("n", "<C-Up>", ":resize -2<CR>")
Map("n", "<C-Down>", ":resize +2<CR>")
Map("n", "<C-Left>", ":vertical resize -2<CR>")
Map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
Map("n", "<S-l>", ":bnext<CR>")
Map("n", "<S-h>", ":bprevious<CR>")

-- Move text up and down
Map("n", "<J>", ":m .+1<CR>==")
Map("n", "<K>", ":m .-2<CR>==")

-- Yank lines
Map("n", "Y", "y$<CR>:lua require('notify')('Line yanked!', 'info')<CR>", { desc = "Yank to end of line" })

-- Select all
Map("n", "<C-a>", "gg0VG$", { desc = "Select all" })

-- Comments
-- Map("n", "<C-c>", "gcc", { remap = true, desc = "Line comment" })
-- Map("n", "<C-b>", "gbc", { remap = true, desc = "Block comment" })
-- Map("n", "<C-p>", "gcip", { remap = true, desc = "Paragraph comment" })

-- ------------------------------------------------
-- [[ Insert ]]
-- ------------------------------------------------

-- ------------------------------------------------
-- [[ Visual ]]
-- ------------------------------------------------

-- Stay in indent mode
Map("v", "<", "<gv^")
Map("v", ">", ">gv^")

-- Move text up and down
Map("v", "<J>", ":m '>+1<CR>gv=gv")
Map("v", "<K>", ":m '<-2<CR>gv=gv")
Map("v", "p", '"_dP')

-- ------------------------------------------------
-- [[ Visual Block ]]
-- ------------------------------------------------

-- Move text up and down
Map("x", "J", ":m '>+1<CR>gv=gv")
Map("x", "K", ":m '<-2<CR>gv=gv")
Map("x", "<C-j>", ":m '>+1<CR>gv=gv")
Map("x", "<C-k>", ":m '<-2<CR>gv=gv")

-- ------------------------------------------------
-- [[ Misc/Experimental ]]
-- ------------------------------------------------

-- Comments
local modes = { "n", "i", "x" }

for _, mode in ipairs(modes) do
	vim.api.nvim_set_keymap(mode, "<C-c>", "gcc", { noremap = false, silent = true })
	vim.api.nvim_set_keymap(mode, "<C-b>", "gbc", { noremap = false, silent = true })
	vim.api.nvim_set_keymap(mode, "<C-p>", "gcip", { noremap = false, silent = true })
end

Map("n", "<Leader>i", ":call append('.', '')<CR>", { desc = "Insert empty line below" })
Map("n", "<Leader>I", ":call append(line('.')-1, '')<CR>", { desc = "Insert empty line above" })

-- Neotree: toggle
Map("n", "<C-e>", "<cmd>Neotree toggle<CR>", {})

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
Map("n", "<Esc>", "<cmd>nohlsearch<CR>")
