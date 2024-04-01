return {
	"akinsho/bufferline.nvim",
	version = "*",

	opts = {
		options = {
			mode = "buffers",
			themable = true,
			close_command = "bdelete! %d",
			right_mouse_command = "bdelete! %d",
			left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
			middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
			indicator = {
				icon = "▎", -- this should be omitted if indicator style is not 'icon'
				-- style = 'underline', -- none, icon or underline
			},
			show_tab_indicators = true,
			always_show_bufferline = false,
			separator_style = "thin", -- "slant" | "slope" | "thick" | "thin"
			hover = {
				enabled = true,
				delay = 500,
				reveal = { "close" },
			},
		},
	},
}
