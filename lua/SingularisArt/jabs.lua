local M = require('SingularisArt.functions')
local jabs = M.safe_require('jabs')

jabs.setup {
  -- Options for the main window
  position = "center", -- center, corner
  width = 50,
  height = 10,
  border = "rounded", -- none, single, double, rounded, solid, shadow, (or an array or chars)

  -- Options for preview window
  preview_position = 'left', -- top, bottom, left, right. Default top
  preview = {
    width = 70,
    height = 20,
    border = "rounded", -- none, single, double, rounded, solid, shadow, (or an array or chars)
  },

  -- Default highlights (must be a valid :highlight)
  highlight = {
    current = "Title", -- default StatusLine
    hidden = "StatusLineNC", -- default ModeMsg
    split = "WarningMsg", -- default StatusLine
    alternate = "StatusLine" -- default WarningMsg
  },
}
