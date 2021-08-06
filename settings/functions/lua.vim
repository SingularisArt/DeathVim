function functions#lua#LuaAddFile(file)
  let g:FilePath = g:SingularisVimLocation . a:file
  if !empty(glob(g:FilePath))
    exec "luafile " . g:FilePath
  endif
endfunction
