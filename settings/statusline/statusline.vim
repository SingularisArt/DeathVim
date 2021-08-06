" The second character in "item" is the type:
"     N for number
"     S for string
"     F for flags as described below
"     - not applicable
"
" ITEM  MEANING ~
"
" f S   Path to the file in the buffer, as typed or relative to current
"         directory.
" F S   Full path to the file in the buffer.
" t S   File name (tail) of file in the buffer.
" m F   Modified flag, text is "[+]"; "[-]" if 'modifiable' is off.
" M F   Modified flag, text is ",+" or ",-".
" r F   Readonly flag, text is "[RO]".
" R F   Readonly flag, text is ",RO".
" h F   Help buffer flag, text is "[help]".
" H F   Help buffer flag, text is ",HLP".
" w F   Preview window flag, text is "[Preview]".
" W F   Preview window flag, text is ",PRV".
" y F   Type of file in the buffer, e.g., "[vim]".  See 'filetype'.
" Y F   Type of file in the buffer, e.g., ",VIM".  See 'filetype'.
" q S   "[Quickfix List]", "[Location List]" or empty.
" k S   Value of "b:keymap_name" or 'keymap' when |:lmap| mappings are
"         being used: "<keymap>"
" n N   Buffer number.
" b N   Value of character under cursor.
" B N   As above, in hexadecimal.
" o N   Byte number in file of byte under cursor, first byte is 1.
"         Mnemonic: Offset from start of file (with one added)
" O N   As above, in hexadecimal.
" N N   Printer page number.  (Only works in the 'printheader' option.)
" l N   Line number.
" L N   Number of lines in buffer.
" c N   Column number.
" v N   Virtual column number.
" V N   Virtual column number as -{num}.  Not displayed if equal to 'c'.
" p N   Percentage through file in lines as in |CTRL-G|.
" P S   Percentage through file of displayed window.  This is like the
"         percentage described for 'ruler'.  Always 3 in length, unless
"         translated.
" a S   Argument list status as in default title.  ({current} of {max})
"         Empty if the argument file count is zero or one.
"
" Thanks to Greg Hurrell for making this amazing statusline

function! statusline#gutterpadding() abort
  let l:minwidth=2
  let l:gutterWidth=max([strlen(line('$')) + 1, &numberwidth, l:minwidth])
  let l:padding=repeat(' ', l:gutterWidth - 1)
  return l:padding
endfunction

function! statusline#fileprefix() abort
  let l:basename=expand('%:h')
  if l:basename == '' || l:basename == '.'
    return ''
  else
    " Make sure we show $HOME as ~.
    return substitute(l:basename . '/', '\C^' . $HOME, '~', '')
  endif
endfunction

function! statusline#ft() abort
  if strlen(&ft)
    return ',' . &ft
  else
    return ''
  endif
endfunction

function! statusline#fenc() abort
  if strlen(&fenc) && &fenc !=# 'utf-8'
    return ',' . &fenc
  else
    return ''
  endif
endfunction

function! statusline#lhs() abort
  let l:line=statusline#gutterpadding()
  let l:line.=&modified ? '+ ' : '  '
  return l:line
endfunction

function! statusline#rhs() abort
  let l:line=' '
  if winwidth(0) > 80
    let l:line.='ℓ ' " (Literal, \u2113 "SCRIPT SMALL L").
    let l:line.=line('.')
    let l:line.='/'
    let l:line.=line('$')
    let l:line.=' 𝚌 ' " (Literal, \u1d68c "MATHEMATICAL MONOSPACE SMALL C").
    let l:line.=virtcol('.')
    let l:line.='/'
    let l:line.=virtcol('$')
    let l:line.=' '
  endif
  return l:line
endfunction

let s:default_lhs_color='Identifier'
let s:async_lhs_color='Constant'
let s:modified_lhs_color='ModeMsg'
let s:singulars_statusline_status_highlight=s:default_lhs_color
let s:async=0

function! statusline#async_start() abort
  let s:async=1
  call statusline#check_modified()
endfunction

function! statusline#async_finish() abort
  let s:async=0
  call statusline#check_modified()
endfunction

function! statusline#check_modified() abort
  if &modified && s:singulars_statusline_status_highlight != s:modified_lhs_color
    let s:singulars_statusline_status_highlight=s:modified_lhs_color
    call statusline#update_highlight()
  elseif !&modified
    if s:async && s:singulars_statusline_status_highlight != s:async_lhs_color
      let s:singulars_statusline_status_highlight=s:async_lhs_color
      call statusline#update_highlight()
    elseif !s:async && s:singulars_statusline_status_highlight != s:default_lhs_color
      let s:singulars_statusline_status_highlight=s:default_lhs_color
      call statusline#update_highlight()
    endif
  endif
endfunction

function! statusline#update_highlight() abort
  " Update StatusLine to use italics (used for filetype).
  let l:highlight=pinnacle#italicize('StatusLine')
  execute 'highlight User1 ' . l:highlight

  " Update MatchParen to use italics (used for blurred statuslines).
  let l:highlight=pinnacle#italicize('MatchParen')
  execute 'highlight User2 ' . l:highlight

  " StatusLine + bold (used for file names).
  let l:highlight=pinnacle#embolden('StatusLine')
  execute 'highlight User3 ' . l:highlight

  " Inverted Error styling, for left-hand side "Powerline" triangle.
  let l:fg=pinnacle#extract_fg(s:singulars_statusline_status_highlight)
  let l:bg=pinnacle#extract_bg('StatusLine')
  execute 'highlight User4 ' . pinnacle#highlight({'bg': l:bg, 'fg': l:fg})

  " And opposite for the buffer number area.
  execute 'highlight User7 ' .
        \ pinnacle#highlight({
        \   'bg': l:fg,
        \   'fg': pinnacle#extract_fg('Normal'),
        \   'term': 'bold'
        \ })

  " Right-hand side section.
  let l:bg=pinnacle#extract_fg('Cursor')
  let l:fg=pinnacle#extract_fg('User3')
  execute 'highlight User5 ' .
        \ pinnacle#highlight({
        \   'bg': l:fg,
        \   'fg': l:bg,
        \   'term': 'bold'
        \ })

  " Right-hand side section + italic (used for %).
  execute 'highlight User6 ' .
        \ pinnacle#highlight({
        \   'bg': l:fg,
        \   'fg': l:bg,
        \   'term': 'bold,italic'
        \ })

  highlight clear StatusLineNC
  highlight! link StatusLineNC User1
endfunction


scriptencoding utf-8

" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
if has('statusline')
  set statusline=%7*                         " Switch to User7 highlight group
  set statusline+=%{statusline#lhs()}
  set statusline+=%*                         " Reset highlight group.
  set statusline+=%4*                        " Switch to User4 highlight group (Powerline arrow).
  set statusline+=                          " Powerline arrow.
  set statusline+=%*                         " Reset highlight group.
  set statusline+=\                          " Space.
  set statusline+=%<                         " Truncation point, if not enough width available.
  set statusline+=%{statusline#fileprefix()} " Relative path to file's directory.
  set statusline+=%3*                        " Switch to User3 highlight group (bold).
  set statusline+=%t                         " Filename.
  set statusline+=%*                         " Reset highlight group.
  set statusline+=\                          " Space.
  set statusline+=%1*                        " Switch to User1 highlight group (italics).

  " Needs to be all on one line:
  "   %(                   Start item group.
  "   [                    Left bracket (literal).
  "   %R                   Read-only flag: ,RO or nothing.
  "   %{statusline#ft()}   Filetype (not using %Y because I don't want caps).
  "   %{statusline#fenc()} File-encoding if not UTF-8.
  "   ]                    Right bracket (literal).
  "   %)                   End item group.
  set statusline+=%([%R%{statusline#ft()}%{statusline#fenc()}]%)

  set statusline+=%*   " Reset highlight group.
  set statusline+=%=   " Split point for left and right groups.

  set statusline+=\               " Space.
  set statusline+=               " Powerline arrow.
  set statusline+=%5*             " Switch to User5 highlight group.
  set statusline+=%{statusline#rhs()}
  set statusline+=%*              " Reset highlight group.

  if has('autocmd')
    augroup SingularsStatusline
      autocmd!
      autocmd ColorScheme * call statusline#update_highlight()
      autocmd User FerretAsyncStart call statusline#async_start()
      autocmd User FerretAsyncFinish call statusline#async_finish()
      if exists('#TextChangedI')
        autocmd BufWinEnter,BufWritePost,FileWritePost,TextChanged,TextChangedI,WinEnter * call statusline#check_modified()
      else
        autocmd BufWinEnter,BufWritePost,FileWritePost,WinEnter * call statusline#check_modified()
      endif
    augroup END
  endif
endif
