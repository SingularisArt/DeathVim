local M = {}

local null_ls = Utils.safe_require("null-ls")
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting

M.setup = function()
  if vim.tbl_isempty(dvim.lsp.formatters) then
    return
  end

  for _, formatter_object in ipairs(dvim.lsp.formatters) do
    if pcall(function() return dvim.builtin.filetypes[formatter_object.filetype].active ~= nil end) then
      if formatter_object.extra_args then
        null_ls.setup({
          formatting[formatter_object.formatter].with { extra_args = formatter_object.extra_args }
        })
      else
        null_ls.setup({
          formatting[formatter_object.formatter]
        })
      end

      Log.trace("[LSP] Toggling formatter for filetype: " ..
        formatter_object.filetype .. " Formatter is: [" .. formatter_object.formatter .. "]")
    else
      Log.error("[NULL-LS] Filetype: [" ..
        formatter_object.filetype .. "] not found in dvim.builtin.filetypes. Please look at the config.lua file.")
    end
  end
end

return M
