let g:SingularisVimLocation = '~/.config/nvim/settings/'

function functions#vim#VimAddFile(file)
  let g:FilePath = g:SingularisVimLocation . a:file
  if !empty(glob(g:FilePath))
    exec "source " . g:FilePath
  endif
endfunction

