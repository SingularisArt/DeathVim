local augroup = require("dvim.vim.augroup")
local autocmd = require("dvim.vim.autocmd")

augroup("Statusline", function()
  autocmd(
    "BufWinEnter,BufWritePost,FileWritePost,TextChanged,TextChangedI,WinEnter",
    "*",
    dvim.statusline.check_modified
  )
  autocmd("ColorScheme", "*", dvim.statusline.update_highlight)
end)
