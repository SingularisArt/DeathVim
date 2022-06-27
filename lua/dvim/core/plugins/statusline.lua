local M = {}

M.setup = function()
	require("dvim.core.plugins." .. dvim.statusline).setup()
end

return M
