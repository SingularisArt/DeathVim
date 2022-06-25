----------------
-- Main Files --
----------------

Utils.safe_require("lspconfig")

Utils.safe_require("dvim.lsp.servers").setup()
Utils.safe_require("dvim.lsp.lsp-signature")
Utils.safe_require("dvim.lsp.handlers").setup()

Utils.safe_require("dvim.lsp.null-ls.diagnostics").setup()
Utils.safe_require("dvim.lsp.null-ls.formatters").setup()
