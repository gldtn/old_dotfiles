return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "moon",
			terminal_colors = true,
			styles = {
				sidebar = "dark",
				floats = "dark",
			},
			-- borderless telescope
			-- opinionated @gldtn
			---@param hl Highlights
			---@param c ColorScheme
			on_highlights = function(hl, c)
				-- define colors
				local bg = c.bg
				local fg = c.fg
				local dark = c.bg_dark
				local blue = c.blue
				local highlight = c.bg_highlight
				-- set colors
				hl.TelescopeNormal = {
					bg = dark,
					fg = fg,
				}
				hl.TelescopeBorder = {
					bg = dark,
					fg = dark,
				}
				hl.TelescopePromptNormal = {
					bg = dark,
				}
				hl.TelescopePromptBorder = {
					bg = dark,
					fg = dark,
				}
				hl.TelescopePromptTitle = {
					bg = blue,
					fg = dark,
				}
				hl.TelescopePreviewTitle = {
					bg = blue,
					fg = dark,
				}
				hl.TelescopeResultsTitle = {
					bg = blue,
					fg = dark,
				}
				hl.NoiceCmdlinePopupBorder = {
					bg = bg,
					fg = bg,
				}
				hl.TelescopeSelection = {
					bg = highlight,
					fg = fg,
				}
			end,
		})
		-- set colorscheme
		vim.cmd([[colorscheme tokyonight]])
	end,
}
