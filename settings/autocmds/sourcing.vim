function autocmds#sourcing#TrimWhiteSpace()
  let save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(save)
endfunction

augroup Singularis
  autocmd!
  autocmd BufWritePre * :call autocmds#sourcing#TrimWhiteSpace()
augroup END

