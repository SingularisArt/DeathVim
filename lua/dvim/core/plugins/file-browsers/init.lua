local M = {}

M.setup = function()
  require("dvim.core.plugins.file-browsers." .. dvim.file_browser).setup()
end

return M
