local M = {}

local null_ls = require("null-ls")
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
local sources = {}

M.setup = function()
  if vim.tbl_isempty(dvim.lsp.formatters) then
    return
  end

  for _, formatter_object in ipairs(dvim.lsp.formatters) do
    if dvim.builtin.filetypes[formatter_object.filetype].active == true then
      if formatter_object.extra_args then
        table.insert(
          sources,
          formatting[formatter_object.formatter].with({ extra_args = formatter_object.extra_args })
        )
      else
        table.insert(sources, formatting[formatter_object.formatter])
      end
    end
  end

  return sources
end

return M
