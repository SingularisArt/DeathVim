-- See also: after/ftplugin/mail.lua.

local nnoremap = SingularisArt.vim.nnoremap
local setlocal = SingularisArt.vim.setlocal

setlocal('list', false)
setlocal('synmaxcol', 0)

nnoremap('j', 'gj', {buffer = true})
nnoremap('k', 'gk', {buffer = true})

SingularisArt.vim.spell()
