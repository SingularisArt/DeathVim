local M = {}

local servers = {}
local ensure_installed = {}

local formatters = require("dvim.lsp.null-ls.formatters").setup()
local linters = require("dvim.lsp.null-ls.linters").setup()

for _, server_object in ipairs(dvim.lsp.language_servers) do
  if dvim.builtin.filetypes[server_object.filetype].active == true then
    servers[server_object.server] = {}
  end
end

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

-- Checking if we want to automatically install the needed linters
if dvim.lsp.automatic_linters_installation then
  for _, linter in pairs(linters) do
    ensure_installed[linter.name] = {}
  end
end

M.setup = function()
  require("dvim.lsp.null-ls").setup()

  require("dvim.lsp.handlers").setup()
  require("dvim.lsp.lsp-signature").setup()
  require("dvim.lsp.mason").setup(ensure_installed, servers)
end

M.setup()
return M
