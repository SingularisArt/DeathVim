local M = {}

M.config = function()
  dvim.builtin.plugins.jabs = {
    active = true,
    setup = {
      -- Options for the main window
      position = "center", -- center, corner. Default corner
      width = 80, -- default 50
      height = 20, -- default 10
      border = "single", -- none, single, double, rounded, solid, shadow, (or an array or chars). Default shadow

      -- Options for preview window
      preview_position = "left", -- top, bottom, left, right. Default top
      preview = {
        width = 40, -- default 70
        height = 60, -- default 30
        border = "single", -- none, single, double, rounded, solid, shadow, (or an array or chars). Default double
      },

      -- Default highlights (must be a valid :highlight)
      highlight = {
        current = "Title", -- default StatusLine
        hidden = "StatusLineNC", -- default ModeMsg
        split = "WarningMsg", -- default StatusLine
        alternate = "StatusLine", -- default WarningMsg
      },

      -- Whether to use nvim-web-devicons next to filenames
      use_devicons = false, -- true or false. Default true
    },
  }
end

M.setup = function()
  M.config()

  require("jabs").setup(dvim.builtin.plugins.jabs.setup)
end

return M
