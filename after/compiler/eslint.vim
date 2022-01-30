if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:lint='eslint\ --format\ stylish'

let s:package_path=wincent#compiler#find('package.json')

if len(s:package_path) > 1
  try
    let s:package_data=json_decode(readfile(s:package_path))
    if (type(s:package_data) == v:t_dict)
      if has_key(s:package_data, 'scripts')
        let s:scripts=s:package_data['scripts']
        if has_key(s:scripts, 'lint')
          let s:lint='yarn\ lint\ --format\ stylish'
        endif
      endif
    endif
  catch
    " Oh well, it was worth a try...
  endtry
endif

execute 'CompilerSet makeprg=' . s:lint

CompilerSet errorformat=
      \%-P%f,
      \%\\s%#%l:%c%\\s%\\+%trror%\\s%\\+%m,
      \%\\s%#%l:%c%\\s%\\+%tarning%\\s%\\+%m,
      \%-Q,
      \%-G%.%#

finish
