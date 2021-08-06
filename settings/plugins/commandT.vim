" Extra config
let g:CommandTCancelMap=['<ESC>', '<C-c>']

if &term =~# 'screen' || &term =~# 'tmux' || &term =~# 'xterm'
  let g:CommandTSelectNextMap = ['<C-j>', '<Down>', '<ESC>OB']
  let g:CommandTSelectPrevMap = ['<C-k>', '<Up>', '<ESC>OA']
endif

let g:CommandTEncoding='UTF-8'
let g:CommandTFileScanner='watchman'
let g:CommandTInputDebounce=50
let g:CommandTMaxCachedDirectories=10
let g:CommandTMaxFiles=3000000
let g:CommandTScanDotDirectories=1
let g:CommandTTraverseSCM='pwd'
let g:CommandTWildIgnore=&wildignore
let g:CommandTWildIgnore.=',*/.git/*'
let g:CommandTWildIgnore.=',*/.hg/*'
let g:CommandTWildIgnore.=',*/bower_components/*'
let g:CommandTWildIgnore.=',*/tmp/*'
let g:CommandTWildIgnore.=',*.class'
let g:CommandTWildIgnore.=',*/classes/*'
let g:CommandTWildIgnore.=',*/build/*'

" Allow Command-T to open selections in dirvish windows.
let g:CommandTWindowFilter='!&buflisted && &buftype == "nofile" && &filetype !=# "dirvish"'

" Mappings
nmap <leader><S-m>a :CommandTTag<CR>
nmap <leader><S-m>b :CommandTBuffer<CR>
nmap <leader><S-m>c :CommandTCommand<CR>
nmap <leader><S-m>l :CommandTLine<CR>
nmap <leader><S-m>s :CommandTSearch<CR>
nmap <leader><S-m>t :CommandT ~/

