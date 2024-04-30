-- Setup color variables
local color = require("tokyonight.colors").setup()
local darken = require("tokyonight.util").darken
local darken_bg = darken(color.comment, 0.3)
local icon = { fg = color.blue, bg = darken(color.comment, 0.3) }
local hl = function(group, attributes)
  vim.api.nvim_set_hl(0, group, attributes)
end

-- Customization for Pmenu
hl("CmpItemMenu", { fg = color.comment, italic = true })
hl("PmenuSel", { bg = color.bg_highlight, fg = "NONE" })
hl("CmpItemAbbrMatch", { fg = color.blue, bg = "NONE", bold = true })
hl("CmpItemAbbrMatchFuzzy", { fg = color.blue, bg = "NONE", bold = true })
hl("CmpItemAbbrDeprecated", { fg = darken(color.fg, 0.5), bg = "NONE", strikethrough = true })

-- Match and set attributes for highlight groups starting with "CmpItemKind"
for _, group in ipairs(vim.fn.getcompletion("CmpItemKind*", "highlight")) do
  hl(group, icon)
end

-- Set item kind highlights
hl("CmpItemKindText", { fg = color.green, bg = darken_bg })
hl("CmpItemKindSnippet", { fg = color.yellow, bg = darken_bg })
hl("CmpItemKindCopilot", { fg = color.green1, bg = darken_bg })
hl("CmpItemKindKeyword", { fg = color.purple, bg = darken_bg })
hl("CmpItemKindOperator", { fg = color.blue5, bg = darken_bg })
hl("CmpItemKindConstant", { fg = color.orange, bg = darken_bg })
hl("CmpItemKindFunction", { fg = color.magenta, bg = darken_bg })
hl("CmpItemKindTypeParameter", { fg = color.green, bg = darken_bg })
