local M = {}

local null_ls = require("null-ls")
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
local sources = {}

M.on_attach = function()
  -- vim.cmd [[
  --   augroup document_highlight
  --     autocmd! * <buffer>
  --     autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  --     autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  --   augroup END
  -- ]]
end

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

      Log.trace("[NULL-LS] Toggling formatter " .. formatter_object.formatter)
    else
      Log.error(
        "[NULL-LS] Filetype: ["
        .. formatter_object.filetype
        .. "] not found in dvim.builtin.filetypes. Please look at the config.lua file."
      )
    end
  end

  return sources
end

return M
