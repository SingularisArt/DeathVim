function! DefineAugroup_For_All()
  augroup MyAllAugroup
    au!
    au FileType * match Bold "\v<[A-Z][A-Z]+>:"
  augroup END
endf

" Enable the automatic highlight for future edited files, and also for the current one:
command! SetHighlightForAll call DefineAugroup_For_All()|exe "set ft=".&ft

" Comment this line to unable the automatic highlight on load:
" au BufEnter SetHighlightForAll
