local M = {}

M.setup = function()
  M.config()

  local impatient = Utils.safe_require('impatient')

  impatient.enable_profile()
end

return M
