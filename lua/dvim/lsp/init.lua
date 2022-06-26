----------------
-- Main Files --
----------------

require_clean("lspconfig")

local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local opts = {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

local servers = {}

for _, server_object in ipairs(dvim.lsp.language_servers) do
  servers[server_object.server] = {}
end

require_clean("dvim.lsp.installer").setup(servers, opts)
require_clean("dvim.lsp.handlers").setup()
require_clean("dvim.lsp.servers").setup()
require_clean("dvim.lsp.lsp-signature")
require("dvim.lsp.null-ls")
