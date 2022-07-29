local M = {}

M.setup = function()
  if dvim.statusline == "lualine" then
    require("dvim.core.plugins.lualine." .. dvim.builtin.plugins.lualine.mode)
  end
end

M.setup()
return M
