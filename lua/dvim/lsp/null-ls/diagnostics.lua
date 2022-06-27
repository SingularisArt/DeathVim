local M = {}

local null_ls = Utils.safe_require("null-ls")
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local sources = {}

M.setup = function()
  if vim.tbl_isempty(dvim.lsp.diagnostics) then
    return
  end

  for _, diagnostic_object in ipairs(dvim.lsp.diagnostics) do
    if pcall(function()
      return dvim.builtin.filetypes[diagnostic_object.filetype].active ~= nil
    end) then
      if diagnostic_object.extra_args then
        table.insert(
          sources,
          diagnostics[diagnostic_object.diagnostic].with({ extra_args = diagnostic_object.extra_args })
        )
      else
        table.insert(sources, diagnostics[diagnostic_object.diagnostic])
      end

      Log.trace(
        "[NULL-LS] Toggling diagnostic "
        .. diagnostic_object.diagnostic
      )
    else
      Log.error(
        "[NULL-LS] Filetype: ["
        .. diagnostic_object.filetype
        .. "] not found in dvim.builtin.filetypes. Please look at the config.lua file."
      )
    end
  end

  return sources
end

return M
