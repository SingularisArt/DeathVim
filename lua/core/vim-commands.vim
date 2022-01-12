hi LspDiagnosticsVirtualTextError          guifg=#db4b4b
hi LspDiagnosticsVirtualTextWarning        guifg=#e0af60
hi LspDiagnosticsVirtualTextInformation    guifg=#0db9d7
hi LspDiagnosticsVirtualTextHint           guifg=#10b981
hi SignColumn ctermbg=None                 guibg=None
hi NormalNC ctermfg=None guifg=None        guibg=None
hi NvimTreeNormal guibg=None')

set foldtext=folds#foldtext()
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

