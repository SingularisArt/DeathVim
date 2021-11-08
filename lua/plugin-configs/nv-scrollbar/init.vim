autocmd CursorMoved,VimResized,QuitPre * lua require('scrollbar').show()
autocmd WinEnter,FocusGained           * lua require('scrollbar').show()
autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * lua require('scrollbar').clear()
