set completeopt+=noinsert
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path='/usr/lib/llvm-6.0/lib/libclang.so'
let g:neosnippet#enable_completed_snippet = 1
let g:python3_host_porg=exepath('python3')

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

let g:LanguageClient_serverCommands = {
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

