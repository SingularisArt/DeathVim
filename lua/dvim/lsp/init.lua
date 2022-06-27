----------------
-- Main Files --
----------------

local M = {}

require_clean("lspconfig")

if dvim.format_on_save then
  vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
end

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

require("dvim.lsp.installer").setup(servers, opts)
require("dvim.lsp.handlers").setup()
require("dvim.lsp.servers").setup()
require("dvim.lsp.lsp-signature")
require("dvim.lsp.null-ls").setup()
