local M = {}

local null_ls = Utils.safe_require("null-ls")
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/completion
local completions = null_ls.builtins.completion
local sources = {}

M.setup = function()
	if vim.tbl_isempty(dvim.lsp.completions) then
		return
	end

	for _, completion_object in ipairs(dvim.lsp.completions) do
    table.insert(sources, completions[completion_object.completion])

		Log.trace("[NULL-LS] Toggling completion " .. completion_object.completion)
	end

  return sources
end

return M
