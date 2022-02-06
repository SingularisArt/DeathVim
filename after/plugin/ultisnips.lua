vim.cmd([[
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-a>"
let g:UltiSnipsJumpBackwardTrigger = "<C-r>"

" open the file in a vertical split
let g:UltiSnipsEditSplit='vertical'

" the location of the snippets
let g:UltiSnipsSnippetDirectories=[$HOME."/.config/nvim/UltiSnips/"]
]])
