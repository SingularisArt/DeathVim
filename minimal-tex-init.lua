vim.cmd[[
set runtimepath+=~/.config/dvim
set runtimepath+=~/.local/share/deathvim/dvim
set runtimepath+=~/.local/share/deathvim/site

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

vim.cmd('color wal')
require('dvim.core.vimtex')
require('dvim.core.ultisnips')

vim.cmd('set showtabline=0')
vim.cmd('set laststatus=0')
