local M = {}

M.setup = function()
  vim.cmd([[
    "set conceallevel=2
    let g:vimtex_view_method = 'sioyek'
    let g:latex_view_general_viewer = 'sioyek'
    let g:vimtex_compiler_progname = 'nvr'
    let g:tex_flavor='latex'
    let g:vimtex_quickfix_enabled=0
  ]])
end

return M
