local M = {}

M.apply_colorscheme = function(colorscheme)
  local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
  if not status_ok then
    return
  end
end

M.highlight_lsp = function()
  vim.cmd([[
    hi LspReferenceText gui=bold guibg=#353d46
    hi LspReferenceRead gui=bold guibg=#353d46
    hi LspReferenceWrite gui=bold guibg=#353d46
  ]])
end

return M
