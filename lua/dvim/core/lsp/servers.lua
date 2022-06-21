-- LSP Servers to install

local M = require("dvim.utils.functions")

local capabilities = M.safe_require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local langservers = {
	"sumneko_lua", -- Lua
	"vimls", -- Vim
	"texlab", -- LaTeX
	"pylsp", -- Python
	"bashls", -- Bash
	"clangd", -- C++,C
	"cmake", -- CMake
	"html", -- HTML
	"cssls", -- CSS
	"jsonls", -- JSON
	"rust_analyzer", -- Rust
	"tsserver", -- Typescript/Javascript
	"jdtls", -- Java
	"yamlls", -- Yaml
}

local config = {
	-- disable virtual text
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

for _, server in ipairs(langservers) do
	if server == "sumneko_lua" then
		M.safe_require("lspconfig")[server].setup({
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
		M.safe_require("lspconfig")[server].setup({
			capabilities = capabilities,
		})
	end

	M.safe_require("lsp_signature").setup({ hi_parameter = "IncSearch" })
end

M.safe_require("goto-preview").setup({})

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
