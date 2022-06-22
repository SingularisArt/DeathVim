local M = {}

M.setup = function()
  vim.cmd([[
    " make YCM compatible with UltiSnips (using supertab)
    let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
    let g:SuperTabDefaultCompletionType = '<C-n>'

    " better key bindings for UltiSnipsExpandTrigger
    let g:UltiSnipsExpandTrigger = "<Enter>"
    let g:UltiSnipsJumpForwardTrigger = "<C-j>"
    let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

    " open the file in a new tab
    let g:UltiSnipsEditSplit='tabdo'

    " the location of the snippets
    let g:UltiSnipsSnippetDirectories=[$HOME."/.local/share/deathvim/dvim/UltiSnips"]
  ]])
end

return M
