" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>CR>
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Create map to add keys to
let g:which_key_map={}
" Define a separator
let g:which_key_sep='→'
set timeoutlen=1000

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Disables which key from being vertical
let g:which_key_vertical=0 " 1 " to be on the right side

" Ignore a specific key map
let g:which_key_map['_'] = { 'name': 'which_key_ignore' }

" Single mappings
" let g:which_key_map[''] = ['command', 'description']

let g:which_key_map.A = {
			\ 'name': '+TagBar',
			\ 't': [':TagbarToggle', 'Open Tagbar'],
			\ 'c': [':TagbarClose', 'Close Tagbar'],
			\ }

let g:which_key_map.B = {
			\ 'name': '+Buffers',
			\ '1': ['b1',							 'buffer 1'],
			\ '2': ['b2',							 'buffer 2'],
			\ 'd': ['bd',					'delete-buffer'],
			\ 'f': ['bfirst',			 'first-buffer'],
			\ 'l': ['blast',					'last-buffer'],
			\ 'n': ['bnext',					'next-buffer'],
			\ 'p': ['bprevious',	'previous-buffer'],
			\ }

let g:which_key_map.D = {
			\ 'name': '+TermDegbug',
			\ 'b': 	[':Break', 											'Set a break point'],
			\ 'c': 	[':Continue', 'Continue the to the next breakpoint'],
			\ 'cl':	[':Clear',	 				'Clears the current breakpoint'],
			\ 'f': 	[':Finish', 									 'Finish the program'],
			\ 'n': 	[':Next', 							'Go to the next breakpoint'],
			\ 'r': 	[':Run', 							 	 'Runs the current program'],
			\ 'se': [':Step', 			 'Step into the current breakpoint'],
			\ 'so': [':Stop', 										 'Stop the debugging'],
			\ 'st': [':Termdebug', 										  'Start the gdb'],
			\ }

let g:which_key_map.G = {
			\ 'name': '+Git',
			\ 'a': [':Git add',       'Add'],
			\ 'c': [':Git commit', 'Commit'],
			\ 'p': [':Git push',	   'Push'],
			\ 'd': [':Git diff',	   'Diff'],
			\ 'l': [':Git log', 	    'Log'],
			\ 'b': [':Git blame',	  'Blame'],
			\ }

autocmd FileType python let g:which_key_map.J = { 'name': '+Jedi' }

let g:which_key_map.L = {
			\ 'name': '+CtrlP',
			\ 'l': [':CtrlP ${PWD}',				'Toggle CtrlP'],
			\ 'b': [':CtrlPBuffer', 'Toggle CtrlPBuffer'],
			\ }

let g:which_key_map.M = {
			\ 'name': '+CommandT',
			\ 't': [':CommandT',                       'Search for files'],
			\ 'a': [':CommandTTag',                      'Jumps to files'],
			\ 'b': [':CommandTBuffer',  'Search through the buffers open'],
			\ 'c': [':CommandTCommand',         'Search through commands'],
			\ 's': [':CommandTSearch',                           'Search'],
			\ 'l': [':CommandTLine',               'Search through lines'],
			\ }

let g:which_key_map.N = {
			\ 'name': '+NvimTreeSitter',
			\ 't': [':NvimTreeToggle',            'Open NerdTree'],
			\ 'c': [':NvimTreeClose',				      'Close NerdTree'],
			\ }

let g:which_key_map.P = {
			\ 'name': '+PlugInstall',
			\ 'i': [':PlugInstall',						  	'Installs all plugins'],
			\ 'c': [':PlugClean',								  	'Cleans all plugins'],
			\ 'd': [':PlugDiff',						'Shows diffs of all plugins'],
			\ 's': [':PlugSnapshot',		'Shows snapshots of all plugins'],
			\ 't': [':PlugStatus',				 'Shows status of all plugins'],
			\ 'p': [':PlugUpdate',							'Updates of all plugins'],
			\ 'g': [':PlugUpgrade',				  	 'Upgrades plugin manager'],
			\ }

let g:which_key_map.R = {
			\ 'name' : '+Terminal' ,
 			\ 'n' : [':FloatermNew node',																						'node'],
 			\ 'p' : [':FloatermNew bpython3',																		'bpython3'],
 			\ 'r' : [':FloatermNew ranger',																				'ranger'],
 			\ 't' : [':FloatermToggle',																						'toggle'],
 			\ 'h' : [':FloatermNew htop',																	          'htop'],
 			\ 's' : [':FloatermNew ncdu',									                          'ncdu'],
			\ }

let g:which_key_map.T = {
				\ 'name': '+Tabs',
				\ 'b': [':bnext<CR>', 												 'next tab'],
				\ 'f': [':tabfirst<CR>', 	  									'first tab'],
				\ 'l': [':tablast<CR>', 											 'last tab'],
				\ 'r': [':tabrewind<CR>',									 'rewindes tab'],
				\ 't': [':tabedit<CR>', 							 'open new tab tab'],
				\ '0': [':tabonly<CR>', 				 'removes all other tabs'],
				\ }


let g:which_key_map.U = {
			\ 'name': '+UltiSnips',
			\ 'e': [':UltiSnipsEdit',																															         'Edit snippets'],
			\ 's': ['NERDTree ~/Singularis/aspects/dotfiles/files/.vim/settings/plugins/snippets/', 'Open Snippets folder'],
			\ }

let g:which_key_map.W = {
      \ 'name' : '+Windows' ,
      \ 'o' : ['<C-W>o', 											'clear all windows'],
      \ 'w' : ['<C-W>w', 													 'other-window'],
      \ 'd' : ['<C-W>c', 						 		 					'delete-window'],
      \ '-' : ['<C-W>s', 										 'split-window-below'],
      \ '|' : ['<C-W>v', 										 'split-window-right'],
      \ '\' : ['<C-W>v', 										 'split-window-right'],
      \ 'h' : ['<C-W>h', 						 	 		 					'window-left'],
      \ 'j' : ['<C-W>j', 													 'window-below'],
      \ 'l' : ['<C-W>l', 													 'window-right'],
      \ 'k' : ['<C-W>k', 								 		 					'window-up'],
      \ 'H' : ['<C-W>H', 										 'expand-window-left'],
      \ 'J' : ['<C-W>J', 										 'expand-window-down'],
      \ 'K' : ['<C-W>K', 				  						 'expand-window-up'],
      \ 'L' : ['<C-W>L', 													 'window-right'],
      \ '1' : [':resize +1<CR>',      				 'expand-window-up'],
      \ '2' : [':resize -1<CR>',   					 'expand-window-down'],
      \ '3' : [':vertical resize +1<CR>',    'expand-window-left'],
      \ '4' : [':vertical resize -1<CR>',   'expand-window-right'],
      \ '=' : ['<C-W>=', 				  	    				 'balance-window'],
			\ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")

