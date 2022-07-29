require_clean("lsp_signature").setup()

if dvim.format_on_save then
  vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
end

local servers = {}

for _, server_object in ipairs(dvim.lsp.language_servers) do
  if dvim.builtin.filetypes[server_object.filetype].active == true then
    servers[server_object.server] = {}
  end
end

local formatters = require("dvim.lsp.null-ls.formatters").setup()
local diagnostics = require("dvim.lsp.null-ls.diagnostics").setup()

local ensure_installed = {}

-- Checking if we want to automatically install the needed servers
if dvim.lsp.automatic_servers_installation then
  for server, _ in pairs(servers) do
    ensure_installed[server] = {}
  end
end

-- Checking if we want to automatically install the needed formatters
if dvim.lsp.automatic_formatters_installation then
  for _, formatter in pairs(formatters) do
    ensure_installed[formatter.name] = {}
  end
end

-- Checking if we want to automatically install the needed diagnostics
if dvim.lsp.automatic_diagnostics_installation then
  for _, diagnostic in pairs(diagnostics) do
    ensure_installed[diagnostic.name] = {}
  end
end

require("dvim.lsp.null-ls").setup()
require("dvim.lsp.handlers").setup()
require("dvim.lsp.inlayhints").setup()
require("dvim.lsp.mason").setup(ensure_installed, servers)
