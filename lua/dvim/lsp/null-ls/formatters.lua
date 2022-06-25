local M = {}

local null_ls = Utils.safe_require("null-ls")
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting

M.setup = function()
  if vim.tbl_isempty(dvim.lsp.formatters) then
    return
  end

  -- Iterate through all formatters
  for _, formatter_object in pairs(dvim.lsp.formatters) do
    for key, value in pairs(formatter_object) do
      if key == "filetype" then
        -- Check if the filetype is active
        if dvim.builtin.filetypes[value].active then
          -- Check if the `extra_args` is within this formatter
          if formatter_object.extra_args then
            -- Add the formatter to the sources table
            null_ls.setup({
              formatting[formatter_object.command].with { extra_args = formatter_object.extra_args }
            })
          else
            null_ls.setup({
              formatting[formatter_object.command]
            })
          end
        end
      end
    end
  end
end

return M
