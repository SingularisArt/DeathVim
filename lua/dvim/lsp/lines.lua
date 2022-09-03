local M = {}

M.setup = function()
  local lsp_lines = require_clean("lsp_lines")

  lsp_lines.setup()

  if dvim.lsp.lsp_lines then
    lsp_lines.toggle()
  end
end

return M
