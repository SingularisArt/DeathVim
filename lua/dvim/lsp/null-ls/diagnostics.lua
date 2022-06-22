local M = {}

local null_ls = require("null-ls")
local services = require("dvim.lsp.null-ls.services")
local method = null_ls.methods.DIAGNOSTICS

function M.list_registered(filetype)
  local registered_providers = services.list_registered_providers_names(filetype)
  return registered_providers[method] or {}
end

function M.list_supported(filetype)
  local s = require("null-ls.sources")
  local supported_linters = s.get_supported(filetype, "diagnostics")
  table.sort(supported_linters)
  return supported_linters
end

function M.setup(linter_configs)
  if vim.tbl_isempty(linter_configs) then
    return
  end

  services.register_sources(linter_configs, method)
end

return M
