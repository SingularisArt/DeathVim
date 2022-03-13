augroup SingularisArtAutocmds
  autocmd!

  autocmd VimResized * execute "normal! \<c-w>="

  " http://vim.wikia.com/wiki/Detect_window_creation_with_WinEnter
  autocmd VimEnter * autocmd WinEnter * let w:created=1
  autocmd VimEnter * let w:created=1

  " Disable paste mode on leaving insert mode.
  autocmd InsertLeave * set nopaste

  " Make current window more obvious by turning off/adjusting some features in non-current
  " windows.
  if exists('+colorcolumn')
    " For entering a buffer
    autocmd BufEnter,FocusGained,VimEnter,WinEnter * if autocmds#should_colorcolumn() | let &l:colorcolumn='+' . join(range(0, 254), ',+') | endif
    " For exiting a buffer
    autocmd FocusLost,WinLeave * if autocmds#should_colorcolumn() | let &l:colorcolumn=join(range(1, 255), ',') | endif
  endif
  autocmd InsertLeave,VimEnter,WinEnter * if autocmds#should_cursorline() | setlocal cursorline | endif
  autocmd InsertEnter,WinLeave * if autocmds#should_cursorline() | setlocal nocursorline | endif
  if has('statusline')
    autocmd BufEnter,FocusGained,VimEnter,WinEnter * call autocmds#focus_statusline()
    autocmd FocusLost,WinLeave * call autocmds#blur_statusline()
  endif

  if has('mksession')
    " Save/restore folds and cursor position.
    autocmd BufWritePost,BufLeave,WinLeave ?* if autocmds#should_mkview() | call autocmds#mkview() | endif
    if has('folding')
      autocmd BufWinEnter ?* if autocmds#should_mkview() | silent! loadview | execute 'silent! ' . line('.') . 'foldopen!' | endif
    else
      autocmd BufWinEnter ?* if autocmds#should_mkview() | silent! loadview | endif
    endif
  elseif has('folding')
    " Like the autocmd described in `:h last-position-jump` but we add `:foldopen!`.
    autocmd BufWinEnter * if line("'\"") > 1 && line("'\"") <= line('$') | execute "normal! g`\"" | execute 'silent! ' . line("'\"") . 'foldopen!' | endif
  else
    autocmd BufWinEnter * if line("'\"") > 1 && line("'\"") <= line('$') | execute "normal! g`\"" | endif
  endif

  autocmd BufWritePost */spell/*.add silent! :mkspell! %
augroup END

augroup _general_settings
  autocmd!
  autocmd FileType qf,help,man,lspinfo,spectre_panel nnoremap <silent> <buffer> q :close<CR> 
  autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
  autocmd BufWinEnter * :set formatoptions-=cro
  autocmd FileType qf set nobuflisted
augroup end

augroup _auto_resize
  autocmd!
  autocmd VimResized * tabdo wincmd = 
augroup end

augroup _alpha
  autocmd!
  autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
augroup end

autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
