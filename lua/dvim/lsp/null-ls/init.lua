local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local function lsp_highlight_document(client)
	local illuminate = require("illuminate")
	illuminate.on_attach(client)
end

M.on_attach = function(client, _)
	local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if not status_cmp_ok then
		return
	end

	M.capabilities.textDocument.completion.completionItem.snippetSupport = true
	M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

	-- lsp_highlight_document(client)
end

M.setup = function()
	local sources = {}
	local null_ls = require("null-ls")

	local formatters = require("dvim.lsp.null-ls.formatters").setup()
	local diagnostics = require("dvim.lsp.null-ls.diagnostics").setup()
	local completions = require("dvim.lsp.null-ls.completions").setup()
	local code_actions = require("dvim.lsp.null-ls.code_actions").setup()
	local hovers = require("dvim.lsp.null-ls.hover").setup()

	for _, formatter_object in pairs(formatters) do
		table.insert(sources, formatter_object)
	end
	for _, diagnostic_object in pairs(diagnostics) do
		table.insert(sources, diagnostic_object)
	end
	for _, completion_object in pairs(completions) do
		table.insert(sources, completion_object)
	end
	for _, code_action_object in pairs(code_actions) do
		table.insert(sources, code_action_object)
	end
	for _, hover_object in pairs(hovers) do
		table.insert(sources, hover_object)
	end

	null_ls.setup({
		sources = sources,
		on_attach = M.on_attach(),
	})
end

return M
