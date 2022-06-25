----------------
-- Main Files --
----------------

dvim.lsp = Utils.safe_require("dvim.lsp.config")
Utils.safe_require("lspconfig")

Utils.safe_require("dvim.lsp.servers").setup()
Utils.safe_require("dvim.lsp.lsp-signature")
Utils.safe_require("dvim.lsp.handlers").setup()

Utils.safe_require("dvim.lsp.null-ls.diagnostics")
Utils.safe_require("dvim.lsp.null-ls.formatters").setup()
