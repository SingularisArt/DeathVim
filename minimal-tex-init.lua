vim.cmd[[
" Quickly closing the window by jamming wq
inoremap wq <Esc>:wq<CR>
nnoremap wq :wq<CR>
inoremap qw <Esc>:wq<CR>
nnoremap qw :wq<CR>
" Quick exit from insert mode
nnoremap j gj
nnoremap k gk
set filetype=tex
                                                  
" Start insert mode between $$'s
autocmd BufEnter * startinsert | call cursor(1, 2)
]]

require('SingularisArt.colorscheme')
require('SingularisArt.vimtex')
require('SingularisArt.ultisnips')

vim.cmd('set showtabline=0')
vim.cmd('set laststatus=0')
