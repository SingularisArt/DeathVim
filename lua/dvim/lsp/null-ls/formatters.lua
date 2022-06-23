local M = {}

local null_ls = Utils.safe_require("null-ls")
local services = Utils.safe_require("dvim.lsp.null-ls.services")
local method = null_ls.methods.FORMATTING

function M.list_registered(filetype)
  local registered_providers = services.list_registered_providers_names(filetype)
  return registered_providers[method] or {}
end

function M.list_supported(filetype)
  local s = Utils.safe_require("null-ls.sources")
  local supported_formatters = s.get_supported(filetype, "formatting")
  table.sort(supported_formatters)
  return supported_formatters
end

function M.setup()
  if vim.tbl_isempty(dvim.lsp.formatters) then
    return
  end

  services.register_sources(dvim.lsp.formatters, method)
end

return M
