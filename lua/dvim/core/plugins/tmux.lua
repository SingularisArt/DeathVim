local M = {}

M.config = function() end

M.setup = function()
	vim.cmd("let g:tmux_navigator_save_on_switch = 2")
end

return M
