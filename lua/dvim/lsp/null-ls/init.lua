local M = {}

M.setup = function()
  require("dvim.lsp.null-ls.code_actions").setup()
  require("dvim.lsp.null-ls.completions").setup()
  require("dvim.lsp.null-ls.diagnostics").setup()
  require("dvim.lsp.null-ls.formatters").setup()
  require("dvim.lsp.null-ls.hover").setup()
end

return M
