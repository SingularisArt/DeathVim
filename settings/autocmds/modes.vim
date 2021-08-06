"#######"
" MODES "
"#######"

autocmd BufNewFile,BufRead *.vpm call autocmds#functions#SetVimPresentationMode()
autocmd BufNewFile,BufRead *.md,*.markdown set nowrap


"#######"
" FILES "
"#######"

augroup autodetect
  au! BufRead,BufNewFile *.asm  set filetype=asm
augroup end

"########"
" SYNTAX "
"########"

autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile /tmp/calcurse/notes/* set filetype=markdown

