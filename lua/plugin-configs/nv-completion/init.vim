let g:completion_enable_auto_popup = 1
let g:completion_enable_snippets = 'UltiSnips'
let g:completion_config_key = "<CR>"

imap <expr> <tab> pumvisible() ? "\<C-j>" : "\<Tab>"
imap <expr> <tab> pumvisible() ? "\<C-k>" : "\<S-Tab>"

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

set completeopt=menuone,noinsert,noselect
set shortmess+=c
