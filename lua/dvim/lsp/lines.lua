local M = {}

M.setup = function()
  local lsp_lines = require_clean("lsp_lines")

  lsp_lines.setup()
  lsp_lines.toggle()
end

return M
