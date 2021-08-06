"  __  __         ___       _ _ __     ___
" |  \/  |_   _  |_ _|_ __ (_) |\ \   / (_)_ __ ___
" | |\/| | | | |  | || '_ \| | __\ \ / /| | '_ ` _ \
" | |  | | |_| |  | || | | | | |_ \ V / | | | | | | |
" |_|  |_|\__, | |___|_| |_|_|\__(_)_/  |_|_| |_| |_|
"         |___/

" Calling my vim functions
source ~/.config/nvim/settings/functions/vim.vim

" Calling general
call functions#vim#VimAddFile('general/settings.vim'            )
call functions#vim#VimAddFile('general/folds.vim'               )

" Calling plugins
call functions#vim#VimAddFile('plugins/plugins.vim'             )
call functions#vim#VimAddFile('plugins/auto_pairs.vim'          )
call functions#vim#VimAddFile('plugins/airline.vim'             )
call functions#vim#VimAddFile('plugins/ctrlp.vim'               )
call functions#vim#VimAddFile('plugins/commandT.vim'            )
call functions#vim#VimAddFile('plugins/deoplete.vim'            )
call functions#vim#VimAddFile('plugins/devicons.vim'            )
call functions#vim#VimAddFile('plugins/emmet.vim'               )
call functions#vim#VimAddFile('plugins/floaterm.vim'            )
call functions#vim#VimAddFile('plugins/highlightedyank.vim'     )
call functions#vim#VimAddFile('plugins/jedi.vim'                )
call functions#vim#VimAddFile('plugins/nerdtree.vim'            )
call functions#vim#VimAddFile('plugins/ruby-heredoc-syntax.vim' )
call functions#vim#VimAddFile('plugins/supertab.vim'            )
call functions#vim#VimAddFile('plugins/startify.vim'            )
call functions#vim#VimAddFile('plugins/syntastic.vim'           )
call functions#vim#VimAddFile('plugins/tagbar.vim'              )
call functions#vim#VimAddFile('plugins/tex-conceal.vim'         )
call functions#vim#VimAddFile('plugins/termdebug.vim'           )
call functions#vim#VimAddFile('plugins/ultisnips.vim'           )
call functions#vim#VimAddFile('plugins/vimtex'                  )
call functions#vim#VimAddFile('plugins/which-key.vim'           )
call functions#vim#VimAddFile('plugins/lsp.vim'                 )

" " Calling statusline
" call functions#vim#VimAddFile('statusline/statusline.vim'       )

" Sourcing autocmds
call functions#vim#VimAddFile('autocmds/other.vim'              )
call functions#vim#VimAddFile('autocmds/functions.vim'          )
call functions#vim#VimAddFile('autocmds/modes.vim'              )
call functions#vim#VimAddFile('autocmds/sourcing.vim'           )

" Calling mappings
call functions#vim#VimAddFile('mappings/sourcing.vim'           )

color wal
set t_Co=256
