local M = {}

local null_ls = Utils.safe_require("null-ls")
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

M.setup = function()
  if vim.tbl_isempty(dvim.lsp.formatters) then
    return
  end

  -- Iterate through all formatters
  for _, diagnostic_object in pairs(dvim.lsp.diagnostics) do
    for key, value in pairs(diagnostic_object) do
      if key == "filetype" then
        -- Check if the filetype is active
        if dvim.builtin.filetypes[value].active then
          -- Check if the `extra_args` is within this formatter
          null_ls.setup({
            diagnostics[diagnostic_object.command]
          })
        end
      end
    end
  end
end

return M
