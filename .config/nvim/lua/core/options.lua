local options = {
	-- Ident settings
	autoindent = true, -- Copy ident from current line
	smartindent = true, -- Smart identing when starting a new line
	tabstop = 4, -- Number of spaces that a <tab> uses
	shiftwidth = 4, -- Number of spaces to use for each step of (auto)ident
	expandtab = true, -- Spaces to inset a <tab> (Insert mode)

	-- Line settings
	number = true, -- Enable line numbers
	relativenumber = false, -- Enable relative numbers
	cursorline = true, -- Enable cursorline highlight
	scrolloff = 999, -- Better scrolling
	wrap = false, -- Disable text wrap

	-- Search settings
	ignorecase = true, -- Ignore case
	incsearch = true, -- Include search
	hlsearch = false, -- Highlight search
	inccommand = "split", -- Split search editing

	-- Window split settings
	splitbelow = true, -- Split window below =P
	splitright = true, -- Split window right =P

	-- Misc settings
	mouse = "a", -- Enable mouse mode
	virtualedit = "block", -- Set highlight to block
	termguicolors = true, -- Better term colors (24-bit)
	clipboard = "unnamedplus", -- Synchronizes the system clipboard
}

-- Loop through & set the options above
for option, value in pairs(options) do
	vim.opt[option] = value
end

-- Set leader key to space
vim.g.mapleader = " "
