let g:html_font=['Hack Nerd Font Regular']

" Open a syntax-colored version of the current file
" suitable for copy-pasting into a presentation.
function! SingularisArt#functions#keynote() abort
  setlocal nonumber
  setlocal norelativenumber
  TOhtml
  let l:tempfile=trim(system('mktemp')) . '.html'
  echomsg l:tempfile
  execute 'saveas! ' . l:tempfile
  execute '!open -b com.google.Chrome ' . l:tempfile
  quit
endfunction

function! SingularisArt#functions#substitute(pattern, replacement, flags) abort
  let l:number=1
  for l:line in getline(1, '$')
    call setline(l:number, substitute(l:line, a:pattern, a:replacement, a:flags))
    let l:number=l:number + 1
  endfor
endfunction

" Sort a .gitmodules file.
"
" See also: https://SingularisArt.com/wiki/Sorting_.gitmodules_entries_with_Vim
function! SingularisArt#functions#sortgitmodules(...) abort
  if &ft ==# 'gitconfig' || a:0
    silent %s/\v\n\t/@@@/e
    %sort
    silent %s/\v\@\@\@/\r\t/ge
  else
    echomsg 'Not a "gitconfig" file: use `SingularisArt#functions#sortgitmodules(1)` to force'
  endif
endfunction

" http://stackoverflow.com/a/39348498/2103996
function! SingularisArt#functions#clearregisters() abort
  let l:regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
  for l:reg in l:regs
    call setreg(l:reg, [])
  endfor
endfunction

" Like :echoerr, but without the stack trace.
function! SingularisArt#functions#echoerr(msg) abort
  try
    echohl ErrorMsg
    echomsg a:msg
  finally
    echohl None
  endtry
endfunction

