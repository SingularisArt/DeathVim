local M = {}

local null_ls = Utils.safe_require("null-ls")
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/hover
local hovers = null_ls.builtins.hover
local sources = {}

M.setup = function()
	if vim.tbl_isempty(dvim.lsp.completions) then
		return
	end

	for _, hover_object in ipairs(dvim.lsp.hovers) do
    table.insert(sources, hovers[hover_object.hover])

		Log.trace("[NULL-LS] Toggling hover " .. hover_object.hover)
	end

	require("null-ls").setup({
		sources = sources,
	})
end

return M
