local M = {}

local null_ls = Utils.safe_require("null-ls")
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

M.setup = function()
  if vim.tbl_isempty(dvim.lsp.formatters) then
    return
  end

  for _, diagnostic_object in ipairs(dvim.lsp.diagnostics) do
    if pcall(function() return dvim.builtin.filetypes[diagnostic_object.filetype].active ~= nil end) then
      Log.trace("[NULL-LS] Toggling diagnostic for filetype: " ..
        diagnostic_object.filetype .. " Diagnostic is: [" .. diagnostic_object.diagnostic .. "]")
      null_ls.setup({
        diagnostics[diagnostic_object.diagnostic]
      })
    else
      Log.error("[NULL-LS] Filetype: [" ..
        diagnostic_object.filetype .. "] not found in dvim.builtin.filetypes. Please look at the config.lua file.")
    end
  end
end

return M
