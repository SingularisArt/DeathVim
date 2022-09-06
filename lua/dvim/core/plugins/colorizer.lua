local M = {}

M.config = function()
  dvim.builtin.plugins.colors.colorizer.setup = {
    filetypes = { "*" },
    user_default_options = {
      RGB = true, -- #RGB hex codes
      RRGGBB = true, -- #RRGGBB hex codes
      names = true, -- "Name" codes like Blue or blue
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      AARRGGBB = true, -- 0xAARRGGBB hex codes
      rgb_fn = true, -- CSS rgb() and rgba() functions
      hsl_fn = true, -- CSS hsl() and hsla() functions
      css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      -- Available modes for `mode`: foreground, background,  virtualtext
      mode = "background", -- Set the display mode.
      -- Available methods are false / "normal" / "lsp" / "both"
      tailwind = true, -- Enable tailwind colors
      virtualtext = "■",
    },
  }
end

M.setup = function()
  local colorizer = require_clean("colorizer")
  colorizer.setup(dvim.builtin.plugins.colors.colorizer.setup)
end

return M
