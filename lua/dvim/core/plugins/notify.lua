local M = {}

M.setup = function()
  local notify = require("notify")
  vim.notify = notify
end

return M
