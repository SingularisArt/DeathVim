----------------
-- Main Files --
----------------

local lspconfig_status = pcall(require, "lspconfig")

if not lspconfig_status then
	vim.notify("Please Install 'nvim-lspconfig'")
	return
end

require("SingularisArt.lsp.handlers").setup()
require("SingularisArt.lsp.servers")
require("SingularisArt.lsp.null")
-- require("SingularisArt.lsp.saga")

