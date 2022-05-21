----------------
-- Main Files --
----------------

local lspconfig_status = pcall(require, "lspconfig")

if not lspconfig_status then
	vim.notify("Please Install 'nvim-lspconfig'")
	return
end

require("user.lsp.handlers").setup()
require("user.lsp.servers")
-- require("user.lsp.null")
