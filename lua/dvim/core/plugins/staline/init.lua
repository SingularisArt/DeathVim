local M = {}

M.setup = function()
	require("dvim.core.plugins.staline." .. dvim.builtin.plugins.staline.mode).setup()
end

return M
