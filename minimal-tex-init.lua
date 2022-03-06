vim.cmd[[
set runtimepath-=~/.config/nvim/after

packadd UltiSnips
packadd vimtex
packadd pywal.nvim

color pywal

highlight Cursor guifg=#192330 guibg=None
highlight Visual ctermbg=11 guibg=#504945
highlight Normal guibg=NONE ctermbg=NONE

set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

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

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<Enter>"
let g:UltiSnipsJumpForwardTrigger = "<C-g>"
let g:UltiSnipsJumpBackwardTrigger = "<C-h>"

" open the file in a vertical split
let g:UltiSnipsEditSplit='vertical'

" the location of the snippets
let g:UltiSnipsSnippetDirectories=[$HOME."/.config/nvim/UltiSnips/"]

let g:vimtex_enable = 1
let g:vimtex_view_method='zathura'
let g:tex_flavor='latex'
set conceallevel=1
]]

