local M = {}

M.setup = function()
  vim.cmd [[
  " Contains CSS for markdown + page + higlight
  let g:mkdp_markdown_css = '/home/singularis/.config/nvim/static/markdown-preview/customStyle.css' 
  " Trick plugin into hosting colors.css so we get nice themes
  let g:mkdp_highlight_css = '/home/singularis/.cache/wal/colors.css'

  let g:vim_markdown_conceal = 1
  let g:vim_markdown_math = 1
  let g:vim_markdown_conceal_code_blocks = 0
  let g:vim_markdown_strikethrough = 1
  ]]
end

return M
