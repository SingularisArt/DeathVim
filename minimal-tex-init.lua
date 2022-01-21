vim.cmd[[
set ft=tex
" Quickly closing the window by jamming wq
inoremap wq <Esc>:wq<CR>
nnoremap wq :wq<CR>
inoremap qw <Esc>:wq<CR>
nnoremap qw :wq<CR>
                                                   
" Start insert mode between $$'s
autocmd BufEnter * startinsert | call cursor(1, 2)
                                                   
nnoremap j gj
nnoremap k gk
]]

require("plugin-configs.cmp")
require("plugin-configs.ultisnips")
