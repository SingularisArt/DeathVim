" Puts vim into presentation mode if the file type is `vpm`
function autocmds#functions#SetVimPresentationMode()
  set filetype=yaml
  nmap <buffer> <Right> :n<CR>
  nmap <buffer> <Left> :N<CR>
  nmap <buffer> <C-q> :qa!<CR>

  if !exists('#goyo')
    Goyo
  endif
  if !exists('#limelight')
    Limelight 1
  endif

  set statusline=0
endfunction

let g:SingularisColorColumnBlacklist = ['diff', 'undotree', 'nerdtree', 'qf']
let g:SingularisCursorlineBlacklist = ['command-t']
let g:SingularisMkviewFiletypeBlacklist = ['diff', 'hgcommit', 'gitcommit']

function! autocmds#functions#attempt_select_last_file() abort
  let l:previous=expand('#:t')
  if l:previous != ''
    call search('\v<' . l:previous . '>')
  endif
endfunction

function! autocmds#functions#should_colorcolumn() abort
  return index(g:SingularisColorColumnBlacklist, &filetype) == -1
endfunction

function! autocmds#functions#should_cursorline() abort
  return index(g:SingularisCursorlineBlacklist, &filetype) == -1
endfunction

" Loosely based on: http://vim.wikia.com/wiki/Make_views_automatic
function! autocmds#functions#should_mkview() abort
  return
        \ &buftype == '' &&
        \ index(g:SingularisMkviewFiletypeBlacklist, &filetype) == -1 &&
        \ !exists('$SUDO_USER') " Don't create root-owned files.
endfunction

function! autocmds#functions#mkview() abort
  if exists('*haslocaldir') && haslocaldir()
    " We never want to save an :lcd command, so hack around it...
    cd -
    mkview
    lcd -
  else
    mkview
  endif
endfunction

function! autocmds#functions#blur_statusline() abort
  " Default blurred statusline (buffer number: filename).
  let l:blurred='%{statusline#gutterpadding()}'
  let l:blurred.='\ ' " space
  let l:blurred.='\ ' " space
  let l:blurred.='\ ' " space
  let l:blurred.='%<' " truncation point
  let l:blurred.='%f' " filename
  let l:blurred.='%=' " split left/right halves (makes background cover whole)
  call s:update_statusline(l:blurred, 'blur')
endfunction

function! autocmds#functions#focus_statusline() abort
  " `setlocal statusline=` will revert to global 'statusline' setting.
  call s:update_statusline('', 'focus')
endfunction

function! s:update_statusline(default, action) abort
  let l:statusline = s:get_custom_statusline(a:action)
  if type(l:statusline) == type('')
    " Apply custom statusline.
    execute 'setlocal statusline=' . l:statusline
  elseif l:statusline == 0
    " Do nothing.
    "
    " Note that order matters here because of Vimscript's insane coercion rules:
    " when comparing a string to a number, the string gets coerced to 0, which
    " means that all strings `== 0`. So, we must check for string-ness first,
    " above.
    return
  else
    execute 'setlocal statusline=' . a:default
  endif
endfunction

function! s:get_custom_statusline(action) abort
  if &ft == 'command-t'
    " Will use Command-T-provided buffer name, but need to escape spaces.
    return '\ \ ' . substitute(bufname('%'), ' ', '\\ ', 'g')
  elseif &ft == 'diff' && exists('t:diffpanel') && t:diffpanel.bufname == bufname('%')
    return 'Undotree\ preview' " Less ugly, and nothing really useful to show.
  elseif &ft == 'undotree'
    return 0 " Don't override; undotree does its own thing.
  elseif &ft == 'nerdtree'
    return 0 " Don't override; NERDTree does its own thing.
  elseif &ft == 'qf'
    if a:action == 'blur'
      return 'Quickfix'
    else
      return g:SingularisQuickfixStatusline
    endif
  endif

  return 1 " Use default.
endfunction

