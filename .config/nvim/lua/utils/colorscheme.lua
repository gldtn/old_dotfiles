-- Set color variables
local color = require("tokyonight.colors").setup()
local darken = require("tokyonight.util").darken
local default_bg = darken(color.comment, 0.3)
local default = { fg = color.blue, bg = darken(color.comment, 0.3) }

local hl = function(group, attributes)
  vim.api.nvim_set_hl(0, group, attributes)
end

-- Customization for Pmenu
hl("CmpItemMenu", { fg = color.comment, italic = true })
hl("PmenuSel", { bg = color.bg_highlight, fg = "NONE" })
hl("CmpItemAbbrMatch", { fg = color.blue, bg = "NONE", bold = true })
hl("CmpItemAbbrMatchFuzzy", { fg = color.blue, bg = "NONE", bold = true })
hl("CmpItemAbbrDeprecated", { fg = darken(color.fg, 0.5), bg = "NONE", strikethrough = true })

-- Set defaults to "CmpItemKind*"
for _, group in ipairs(vim.fn.getcompletion("CmpItemKind*", "highlight")) do
  hl(group, default)
end

-- Set kind highlights
hl("CmpItemKindText", { fg = color.green, bg = default_bg })
hl("CmpItemKindSnippet", { fg = color.yellow, bg = default_bg })
hl("CmpItemKindCopilot", { fg = color.green1, bg = default_bg })
hl("CmpItemKindKeyword", { fg = color.purple, bg = default_bg })
hl("CmpItemKindOperator", { fg = color.blue5, bg = default_bg })
hl("CmpItemKindConstant", { fg = color.orange, bg = default_bg })
hl("CmpItemKindFunction", { fg = color.magenta, bg = default_bg })
hl("CmpItemKindTypeParameter", { fg = color.green, bg = default_bg })
