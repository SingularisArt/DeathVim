local M = {}

M.setup = function()
  vim.cmd [[
  let g:vimtex_view_method='zathura'
  let g:tex_flavor='latex'
  set conceallevel=2
  let g:vimtex_quickfix_enabled=0
  ]]
end

return M
