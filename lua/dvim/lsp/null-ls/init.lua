local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.on_attach = function(_, _)
  local cmp_nvim_lsp = require_clean("cmp_nvim_lsp")

  M.capabilities.textDocument.completion.completionItem.snippetSupport = true
  M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)
end

M.get_sources = function()
  local sources = {}
  local sources_names = {}

  local formatters = require("dvim.lsp.null-ls.formatters").setup()
  local diagnostics = require("dvim.lsp.null-ls.diagnostics").setup()
  local completions = require("dvim.lsp.null-ls.completions").setup()
  local code_actions = require("dvim.lsp.null-ls.code_actions").setup()
  local hovers = require("dvim.lsp.null-ls.hover").setup()

  for _, formatter_object in pairs(formatters) do
    table.insert(sources, formatter_object)
    sources_names[formatter_object.name] = {}
  end
  for _, diagnostic_object in pairs(diagnostics) do
    table.insert(sources, diagnostic_object)
    sources_names[diagnostic_object.name] = {}
  end
  for _, completion_object in pairs(completions) do
    table.insert(sources, completion_object)
    sources_names[completion_object.name] = {}
  end
  for _, code_action_object in pairs(code_actions) do
    table.insert(sources, code_action_object)
    sources_names[code_action_object.name] = {}
  end
  for _, hover_object in pairs(hovers) do
    table.insert(sources, hover_object)
    sources_names[hover_object.name] = {}
  end

  return sources, sources_names
end

---@table
---Table with all the sources for null-ls
---This table can be found in the user config.lua file
M.sources, M.sources_names = M.get_sources()

M.setup = function()
  local null_ls = require("null-ls")

  null_ls.setup({
    sources = M.sources,
    on_attach = M.on_attach(),
  })
end

return M
