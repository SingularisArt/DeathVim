local M = {}

local null_ls = require_clean("null-ls")
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/linters
local linters = null_ls.builtins.diagnostics

local sources = {}

M.setup = function()
  if vim.tbl_isempty(dvim.lsp.linters) then
    return
  end

  for _, linter_object in ipairs(dvim.lsp.linters) do
    if dvim.builtin.filetypes[linter_object.filetype].active == true then
      if linter_object.extra_args then
        table.insert(sources, linters[linter_object.linter].with({ extra_args = linter_object.extra_args }))
      else
        table.insert(sources, linters[linter_object.linter])
      end
    end
  end

  return sources
end

return M
