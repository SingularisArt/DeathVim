local augroup = SingularisArt.vim.augroup
local autocmd = SingularisArt.vim.autocmd

SingularisArt.statusline.set()

augroup('SingularisArtStatusline', function()
  autocmd(
    'BufWinEnter,BufWritePost,FileWritePost,TextChanged,TextChangedI,WinEnter',
    '*',
    SingularisArt.statusline.check_modified
  )
  autocmd('ColorScheme', '*', SingularisArt.statusline.update_highlight)
  autocmd('User', 'FerretAsyncStart', SingularisArt.statusline.async_start)
  autocmd('User', 'FerretAsyncFinish', SingularisArt.statusline.async_finish)
end)
