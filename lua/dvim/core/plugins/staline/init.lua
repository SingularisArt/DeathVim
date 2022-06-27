local M = {}

M.setup = function()
  if dvim.statusline == "staline" then
    require("dvim.core.plugins.staline." .. dvim.builtin.plugins.staline.mode).setup()
  end
end

return M
