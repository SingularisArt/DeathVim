packadd termdebug

hi debugPC term=reverse ctermbg=4 guibg=darkblue

let g:termdebug_popup = 0
let g:termdebug_wide = 163

nmap <leader><S-d>b   :Break<CR>
nmap <leader><S-d>c   :Continue<CR>
nmap <leader><S-d>cl  :Clear<CR>
nmap <leader><S-d>f   :Finish<CR>
nmap <leader><S-d>n   :Next<CR>
nmap <leader><S-d>r   :Run<CR>
nmap <leader><S-d>se  :Step<CR>
nmap <leader><S-d>so  :Stop<CR>
nmap <leader><S-d>st  :Termdebug<CR>
