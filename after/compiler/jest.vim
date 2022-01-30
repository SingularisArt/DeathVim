if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:jest='jest'

let s:package_path=wincent#compiler#find('package.json')

if len(s:package_path) > 1
  try
    let s:package_data=json_decode(readfile(s:package_path))
    if (type(s:package_data) == v:t_dict)
      if has_key(s:package_data, 'scripts')
        let s:scripts=s:package_data['scripts']
        if has_key(s:scripts, 'test')
          " Let's hope this is actually Jest...
          let s:jest='yarn\ test'
        elseif has_key(s:scripts, 'jest')
          let s:jest='yarn\ jest'
        endif
      endif
    endif
  catch
    " Oh well, it was worth a try...
  endtry
endif

execute 'CompilerSet makeprg=' . s:jest

CompilerSet errorformat=
      \%-G%[%^\ ]%.%#,
      \%A%\\s%\\+●\ %m,
      \%Z%\\s%\\+at\ %.%#\ (%f:%l:%c),
      \%C%.%#,
      \%-G%.%#,

finish
