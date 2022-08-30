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

if dvim.builtin.plugins.winbar.active or dvim.builtin.plugins.winbar.type ~= "winbar" then
  augroup("Winbar", function()
    autocmd(
      "CursorMoved,BufWinEnter,BufFilePost,InsertEnter,BufWritePost",
      "*",
      "lua require('dvim.core.plugins.winbar').setup()"
    )
  end)
end
