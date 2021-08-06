" Syntastic symbols
let g:syntastic_style_error_symbol = '⚡'
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '⚡'

" Language checkers
let g:syntastic_python_checkers = ['flake8', 'pylint', 'pep8', 'pycodestyle', 'python']

let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_cpp_clang_tidy_args = '-checks=*'

" Extra config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
