local M = {}
local g = vim.g

g.dvim_ui = {
  -- find a list of themes at https://github.com/NvChad/nvim-base16.lua/tree/master/lua/themes
  theme = "nord",
  -- Find a list of options at lua/statusline.lua(icon_styles var)
  statusline_style = "arrow",
  -- transparent = true,
}

-- set the global theme, used at various places like theme switcher, highlights
local theme = g.dvim_ui.theme

local base16 = require("base16")
-- first load the base16 theme
--base16(base16.themes(theme), true)

-- returns a table of colors for give or current theme
M.get = function(theme_opt)
  if theme_opt then
    return require("hl_themes." .. theme_opt)
  end
  return require("hl_themes." .. theme)
end

return M

