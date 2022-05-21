require("SingularisArt")

vim.cmd('set rtp+=~/Documents/school-notes/current-course')

require('SingularisArt.plugins')

vim.cmd([[
color pywal

highlight Cursor guifg=#F8F8F8 guibg=#A7A7A7
highlight Visual ctermbg=11 guibg=#504945

set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
]])

-- Require the lsp config
require("SingularisArt.lsp")
require('SingularisArt.lualine').setup()

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
