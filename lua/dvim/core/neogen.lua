local M = {}

M.setup = function()
  local neogen = Utils.safe_require('neogen')

  neogen.setup {}
end

return M
