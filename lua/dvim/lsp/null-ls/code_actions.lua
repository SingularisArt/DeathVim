local M = {}

local null_ls = require_clean("null-ls")
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local code_actions = null_ls.builtins.code_actions
local sources = {}

M.setup = function()
	if vim.tbl_isempty(dvim.lsp.code_actions) then
		return
	end

	for _, code_actions_object in ipairs(dvim.lsp.code_actions) do
    table.insert(sources, code_actions[code_actions_object.code_action])

		Log.trace("[NULL-LS] Toggling code action " .. code_actions_object.code_action)
	end

  return sources
end

return M
