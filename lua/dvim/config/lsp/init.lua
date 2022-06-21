----------------
-- Main Files --
----------------

local M = require("SingularisArt.functions")

M.safe_require("lspconfig")

M.safe_require("SingularisArt.lsp.servers")
M.safe_require("SingularisArt.lsp.lsp-signature")
M.safe_require("SingularisArt.lsp.handlers").setup()
M.safe_require("SingularisArt.lsp.null-lsp")
