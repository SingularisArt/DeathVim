let g:diminactive_use_syntax = 1
let g:diminactive_enable_focus = 1

autocmd BufLeave * LspStop
autocmd BufEnter * LspStart

augroup Semshi
  autocmd!
  autocmd BufLeave *.py Semshi disable
  autocmd BufEnter *.py Semshi enable
augroup END
