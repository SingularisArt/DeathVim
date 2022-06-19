----------------
-- Main Files --
----------------

local M = require('SingularisArt.functions')

M.safe_require('lspconfig')

M.safe_require("SingularisArt.lsp.handlers").setup()
M.safe_require("SingularisArt.lsp.servers")
-- require("SingularisArt.lsp.null")
