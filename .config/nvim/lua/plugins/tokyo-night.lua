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
      -- Highlights
      ---@param hl Highlights
      ---@param c ColorScheme
      on_highlights = function(hl, c)
        -- define colors
        local bg = c.bg
        local fg = c.fg
        local dark = c.bg_dark
        local pro_bg = "#292B41"
        local pro_title = c.red
        local pre_title = c.blue
        local res_title = c.magenta
        local highlight = c.bg_highlight

        -- telescope
        hl.TelescopeNormal = { bg = dark, fg = fg, }
        hl.TelescopeBorder = { bg = dark, fg = dark, }
        hl.TelescopePromptNormal = { bg = pro_bg, }
        hl.TelescopePromptBorder = { bg = pro_bg, fg = pro_bg, }
        hl.TelescopePromptTitle = { bg = pro_title, fg = pro_bg, }
        hl.TelescopePreviewTitle = { bg = pre_title, fg = dark, }
        hl.TelescopeResultsTitle = { bg = res_title, fg = dark, }
        hl.NoiceCmdlinePopupBorder = { bg = bg, fg = bg, }
        hl.TelescopeSelection = { bg = highlight, fg = fg, }
        -- whichkey
        hl.WhichKeyBorder = { bg = dark, fg = dark, }
        -- toggleterm
        hl.ToggleTermNormal = { bg = dark, fg = dark, }
        hl.ToggleTermNormalFloat = { bg = dark, fg = dark, }
        hl.ToggleTermFloatBorder = { bg = dark, fg = dark, }
      end,
    })

    -- set colorscheme
    vim.cmd([[colorscheme tokyonight]])
  end,
}
