local cmd = vim.cmd

local override = require("core.utils").load_config().ui.hl_override
local colors = require("colors").get()
local ui = require("core.utils").load_config().ui

local purple = colors.color0
local red = colors.color1
local white = colors.color2
local yellow = colors.color3
local orange = colors.color4
local color113 = colors.color5

local background = colors.background
local foreground = colors.foreground
local cursor     = colors.cursor
local color0  = colors.color0
local color1  = colors.color1
local color2  = colors.color2
local color3  = colors.color3
local color4  = colors.color4
local color5  = colors.color5
local color6  = colors.color6
local color7  = colors.color7
local color8  = colors.color8
local color9  = colors.color9
local color10 = colors.color10
local color11 = colors.color11
local color12 = colors.color12
local color13 = colors.color13
local color14 = colors.color14
local color15 = colors.color15

-- functions for setting highlights
local fg = require("core.utils").fg
local fg_bg = require("core.utils").fg_bg
local bg = require("core.utils").bg

-- Comments
if ui.italic_comments then
   fg("Comment", color8 .. " gui=italic")
else
   fg("Comment", color8)
end

-- Line number
fg("cursorlinenr", white)

-- same it bg, so it doesn't appear
fg("EndOfBuffer", color0)

-- For floating windows
fg("FloatBorder", color3)
bg("NormalFloat", color4)

-- Pmenu
bg("Pmenu", color11)
bg("PmenuSbar", color11)
bg("PmenuSel", color12)
bg("PmenuThumb", color10)
fg("CmpItemAbbr", white)
fg("CmpItemAbbrMatch", white)
fg("CmpItemKind", white)
fg("CmpItemMenu", white)

-- misc

-- inactive statuslines as thin lines
fg("StatusLineNC", color113 .. " gui=underline")

fg("LineNr", color7)
fg("NvimInternalError", red)
fg("VertSplit", color11)

if ui.transparency then
   bg("Normal", "NONE")
   bg("Folded", "NONE")
   fg("Folded", "NONE")
   fg("Comment", color7)
end

-- [[ Plugin Highlights

-- Dashboard
fg("DashboardCenter", color8)
fg("DashboardFooter", color8)
fg("DashboardHeader", color8)
fg("DashboardShortcut", color8)

-- Git signs
fg_bg("DiffAdd", color3, "NONE")
fg_bg("DiffChange", color8, "NONE")
fg_bg("DiffChangeDelete", red, "NONE")
fg_bg("DiffModified", red, "NONE")
fg_bg("DiffDelete", red, "NONE")

-- Indent blankline plugin
fg("IndentBlanklineChar", color9)

-- Lsp diagnostics

fg("DiagnosticHint", purple)
fg("DiagnosticError", red)
fg("DiagnosticWarn", yellow)
fg("DiagnosticInformation", color6)

-- NvimTree
fg("NvimTreeEmptyFolderName", color5)
fg("NvimTreeEndOfBuffer", color4)
fg("NvimTreeFolderIcon", color5)
fg("NvimTreeFolderName", color5)
fg("NvimTreeGitDirty", red)
fg("NvimTreeIndentMarker", color11)
bg("NvimTreeNormal", color4)
bg("NvimTreeNormalNC", color4)
fg("NvimTreeOpenedFolderName", color5)
fg("NvimTreeRootFolder", red .. " gui=underline") -- enable underline for root folder in nvim tree
fg_bg("NvimTreeStatuslineNc", color4, color4)
fg("NvimTreeVertSplit", color4)
bg("NvimTreeVertSplit", color4)
fg_bg("NvimTreeWindowPicker", red, color1)

-- Telescope
fg_bg("TelescopeBorder", color4, color4)
fg_bg("TelescopePromptBorder", color1, color1)

fg_bg("TelescopePromptNormal", white, color1)
fg_bg("TelescopePromptPrefix", red, color1)

bg("TelescopeNormal", color4)

fg_bg("TelescopePreviewTitle", color0, color6)
fg_bg("TelescopePromptTitle", color0, red)
fg_bg("TelescopeResultsTitle", color4, color4)

bg("TelescopeSelection", color1)

-- keybinds cheatsheet

fg_bg("CheatsheetBorder", color0, color0)
bg("CheatsheetSectionContent", color0)
fg("CheatsheetHeading", white)

local section_title_colors = {
   white,
   color3,
   red,
   color6,
   yellow,
   purple,
   orange,
}
for i, color in ipairs(section_title_colors) do
   vim.cmd("highlight CheatsheetTitle" .. i .. " guibg = " .. color .. " guifg=" .. color0)
end

-- Disable some highlight in nvim tree if transparency enabled
if ui.transparency then
   bg("NormalFloat", "NONE")
   bg("NvimTreeNormal", "NONE")
   bg("NvimTreeNormalNC", "NONE")
   bg("NvimTreeStatusLineNC", "NONE")
   bg("NvimTreeVertSplit", "NONE")
   fg("NvimTreeVertSplit", color7)

   -- telescope
   bg("TelescopeBorder", "NONE")
   bg("TelescopePrompt", "NONE")
   bg("TelescopeResults", "NONE")
   bg("TelescopePromptBorder", "NONE")
   bg("TelescopePromptNormal", "NONE")
   bg("TelescopeNormal", "NONE")
   bg("TelescopePromptPrefix", "NONE")
   fg("TelescopeBorder", color11)
   fg_bg("TelescopeResultsTitle", color0, color3)
end

if #override ~= 0 then
   require(override)
end
