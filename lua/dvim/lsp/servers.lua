local capabilities = Utils.safe_require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local config = {
	virtual_text = false,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

for _, server in ipairs(dvim.language_servers) do
	if server == "sumneko_lua" then
		Utils.safe_require("lspconfig")[server].setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "use" },
					},
				},
			},
		})
	else
		Utils.safe_require("lspconfig")[server].setup({
			capabilities = capabilities,
		})
	end

	Utils.safe_require("lsp_signature").setup({ hi_parameter = "IncSearch" })
end

Utils.safe_require("goto-preview").setup({})

vim.diagnostic.config(config)

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end
