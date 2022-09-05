local M = {}

M.config = function()
  dvim.builtin.plugins.colors.colorizer.setup = {
    RGB = true, -- #RGB hex codes
    RRGGBB = true, -- #RRGGBB hex codes
    names = true, -- "Name" codes like Blue or blue
    RRGGBBAA = true, -- #RRGGBBAA hex codes
    rgb_fn = true, -- CSS rgb() and rgba() functions
    hsl_fn = true, -- CSS hsl() and hsla() functions
    css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    mode = "background",
  }
end

M.setup = function()
  local colorizer = require_clean("colorizer")
  colorizer.setup(dvim.builtin.plugins.colors.colorizer.setup)
end

return M
