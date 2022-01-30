if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:lint='yarn\ run\ tsc\ --noEmit\ --incremental\ false'

execute 'CompilerSet makeprg=' . s:lint

CompilerSet errorformat=
      \%E%f:%l:%c%\\s%\\+-%\\s%\\+%trror%\\s%\\+TS%n:%\\s%\\+%m,
      \%-G%[%^\ 0-9]%.%#,
      \%-G%\\s%#

finish

