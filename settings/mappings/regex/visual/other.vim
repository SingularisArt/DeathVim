function! s:Visual()
  return visualmode() == 'V'
endfunction

function! s:Move(address, should_move)
  if s:Visual() && a:should_move
    execute "'<,'>move " . a:address
    call feedkeys('gv=', 'n')
  endif
  call feedkeys('gv', 'n')
endfunction

function! s:move_up() abort range
  let l:count=v:count ? -v:count : -1
  let l:max=(a:firstline - 1) * -1
  let l:movement=max([l:count, l:max])
  let l:address="'<" . (l:movement - 1)
  let l:should_move=l:movement < 0
  call s:Move(l:address, l:should_move)
endfunction

function! s:move_down() abort range
  let l:count=v:count ? v:count : 1
  let l:max=line('$') - a:lastline
  let l:movement=min([l:count, l:max])
  let l:address="'>+" . l:movement
  let l:should_move=l:movement > 0
  call s:Move(l:address, l:should_move)
endfunction

xnoremap <silent> K :call move_up()<CR>
xnoremap <silent> J :call move_down()<CR>

:highlight Search guibg=bg guifg=fg gui=underline

vmap J :m '>+1<CR>gv=gv
vmap K :m '<-2<CR>gv=gv
