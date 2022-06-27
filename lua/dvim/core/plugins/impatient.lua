local M = {}

M.setup = function()
  M.config()

  local impatient = require('impatient')

  impatient.enable_profile()
end

return M
