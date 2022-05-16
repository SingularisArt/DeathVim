vim.cmd([[
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<Enter>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

" open the file in a vertical split
let g:UltiSnipsEditSplit='vertical'

" the location of the snippets
let g:UltiSnipsSnippetDirectories=[$HOME."/.config/nvim/UltiSnips/", "UltiSnips"]

iunmap <Tab>
]])
