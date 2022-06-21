----------------
-- Main Files --
----------------

local M = require("dvim.utils.functions")

M.safe_require("lspconfig")

M.safe_require("dvim.core.lsp.servers")
M.safe_require("dvim.core.lsp.lsp-signature")
M.safe_require("dvim.core.lsp.handlers").setup()
M.safe_require("dvim.core.lsp.null-lsp")
