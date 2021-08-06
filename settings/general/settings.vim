let g:mapleader=" "                     " Set leader key

scriptencoding utf-8

set backspace=indent,start,eol          " Allow unrestricted backspacing in insert mode

packadd termdebug                       " Adds termdebug to vim since it isn't in vim by default
set scrolloff=999                       " Keeps the cursor in the middle of the screen

set nohlsearch                          " Turns off highlighting after done seraching
set incsearch                           " Highlights while I search

set shortmess=I                         " Disables startup page in vim

set encoding=utf-8                      " The encoding displayed
set fileencoding=latin1                 " The encoding written to file

set pumheight=10                        " Makes popup menu smaller
set cmdheight=2                         " More space for displaying messages

set mouse=a                             " Enable your mouse
" set cursorline                          " Shows us where our current cursor is at

if has('windows')
  set splitbelow                        " Open horizontal splits below current window
endif

if has('vertsplit')
  set splitright                        " Open vertical splits to the right of the current window
endif

set tabstop=2 softtabstop=2             " Making my tabs 2 space big
set shiftwidth=2                        " Stops tab at 2 spaces
set expandtab                           " Expands the tab
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set conceallevel=0                      " So that I can see `` in markdown files
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set showtabline=2                       " Always show tabs

set smartcase                           " Makes seraches case sensetive

set complete+=kspell
set spelllang=en_us

if has('wildignore')
  set backupskip+=*.re,*.rei            " Prevent bsb's watch mode from getting confused
endif

if exists('&belloff')
  set belloff=all                       " Never ring the bell for any reason
endif

" if exists('+colorcolumn')
"   set colorcolumn=80                    " Shows us the 80 character mark
" endif

" Recommended settings for nvim-compe:
set completeopt=menuone                 " Show menu even if there is only one candidate
set completeopt+=noselect               " Don't automatically select canditate

set diffopt+=foldcolumn:0               " Don't show fold column in diff view

set noemoji                             " Don't assume all emoji are double width

if has('folding')
  if has('windows')
    set fillchars=diff:∙                " BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
    set fillchars+=fold:·               " MIDDLE DOT (U+00B7, UTF-8: C2 B7)
    set fillchars+=vert:┃               " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
  endif

  if has('nvim-0.3.1')
    set fillchars+=eob:\                " Suppress ~ at EndOfBuffer
  endif

  set foldmethod=manual                 " Not as cool as syntax, but faster
  set foldlevelstart=99                 " Start unfolded
  set foldtext=folds#foldtext()
endif

if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j                  " Remove comment leader when joining comment lines
endif

set formatoptions+=n                    " Smart auto-indenting inside numbered lists
set guifont=Source\ Code\ Pro\ Light:h13
set guioptions-=T                       " Don't show toolbar
set hidden                              " Allows you to hide buffers with unsaved changes without being prompted

if !has('nvim')
  " Sync with corresponding nvim :highlight commands in ~/.config/nvim/plugin/autocmds.vim:
  set highlight+=@:Conceal              " ~/@ at end of window, 'showbreak'
  set highlight+=D:Conceal              " Override DiffDelete
  set highlight+=N:FoldColumn           " Make current line number stand out a little
  set highlight+=c:LineNr               " Blend vertical separators with line numbers
endif

if exists('&inccommand')
  set inccommand=split                  " Live preview of :s results
endif

set laststatus=2                        " Always show status line
set lazyredraw                          " Don't bother updating screen during macro playback

if has('linebreak')
  set linebreak                         " Wrap long lines at characters in 'breakat'
endif

set listchars=nbsp:⦸                    " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:▷┅                   " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
                                        " + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
set listchars+=extends:»                " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:«               " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•                  " BULLET (U+2022, UTF-8: E2 80 A2)
set modelines=5                         " Scan this many lines looking for modeline
set nojoinspaces                        " Don't autoinsert two spaces after '.', '?', '!' for join command
set number                              " Show line numbers in gutter

if exists('+pumblend')
  set pumblend=10                       " Pseudo-transparency for popup-menu
endif

if exists('+relativenumber')
  set relativenumber                    " Show relative numbers in gutter
endif

set shell=sh                            " Shell to use for `!`, `:!`, `system()` etc.
set noshiftround                        " Don't always indent by multiple of shiftwidth
set shortmess+=A                        " Ignore annoying swapfile messages
set shortmess+=I                        " No splash screen
set shortmess+=O                        " File-read message overwrites previous
set shortmess+=T                        " Truncate non-file messages in middle
set shortmess+=W                        " Don't echo "[w]"/"[written]" when writing
set shortmess+=a                        " Use abbreviations in messages eg. `[RO]` instead of `[readonly]`
if has('patch-7.4.314')
  set shortmess+=c                      " Completion messages
endif
set shortmess+=o                        " Overwrite file-written messages
set shortmess+=t                        " Truncate file messages at start

if has('linebreak')
  let &showbreak='↳ '                   " DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
endif

if has('showcmd')
  set noshowcmd                         " Don't show extra info at end of command line
endif

set noshowmode                          " Disables the --INSERT-- under the statusline
set sidescroll=0                        " Sidescroll in jumps because terminals are slow
set sidescrolloff=3                     " Same as scrolloff, but for columns

if v:progname !=# 'vi'
  set softtabstop=-1                    " Use 'shiftwidth' for tab/bs at end of line
endif

if has('syntax')
  set spellcapcheck=                    " Don't check for capital letters at start of sentence
endif

set suffixes-=.h                        " Don't sort header files at lower priority

if exists('&swapsync')
  set swapsync=                         " Let OS sync swapfiles lazily
endif
set switchbuf=usetab                    " Try to reuse windows/tabs when switching buffers

if has('syntax')
  set synmaxcol=200                     " Don't bother syntax highlighting long lines
endif

" if has('termguicolors')
"   set termguicolors                     " Use guifg/guibg instead of ctermfg/ctermbg in terminal
" endif

set nowrap                              " Allows text to go off screen
" set textwidth=80                        " Automatically hard wrap at 80 columns

set updatecount=80                      " Update swapfiles every 80 typed chars
set updatetime=2000                     " CursorHold interval

if exists('s:viminfo')
  if exists('$SUDO_USER')
    " Don't create root-owned files.
    execute 'set ' . s:viminfo . '='
    execute 'set ' . s:viminfo . 'file=NONE'
  else
    " Defaults:
    "   Neovim: !,'100,<50,s10,h
    "   Vim:    '100,<50,s10,h
    "
    " - ! save/restore global variables (only all-uppercase variables)
    " - '100 save/restore marks from last 100 files
    " - <50 save/restore 50 lines from each register
    " - s10 max item size 10KB
    " - h do not save/restore 'hlsearch' setting
    "
    " Our overrides:
    " - '0 store marks for 0 files
    " - <0 don't save registers
    " - f0 don't store file marks
    " - n: store in ~/.config/nvim/ or ~/.vim/
    "
    if has('nvim')
      execute 'set ' . s:viminfo . "='0,<0,f0,n~/.config/nvim/" . s:viminfo
      if !empty(glob('~/.config/nvim/' . s:viminfo))
        if !filereadable(expand('~/.config/nvim/' . s:viminfo))
          echoerr 'warning: ~/.config/nvim/' . s:viminfo . ' exists but is not readable'
        endif
      endif
    else
      execute 'set ' . s:viminfo . "='0,<0,f0,n~/.vim/" . s:viminfo
      if !empty(glob('~/.vim/' . s:viminfo))
        if !filereadable(expand('~/.vim/' . s:viminfo))
          echoerr 'warning: ~/.vim/' . s:viminfo . ' exists but is not readable'
        endif
      endif
    endif

  endif
endif

if has('mksession')
  set viewoptions=cursor,folds          " Save/restore just these (with `:{mk,load}view`)
endif

if has('virtualedit')
  set virtualedit=block                 " Allow cursor to move where there is no text in visual block mode
endif
set visualbell t_vb=                    " Stop annoying beeping for non-error errors
set whichwrap=b,h,l,s,<,>,[,],~         " Allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
set wildcharm=<C-z>                     " Substitute for 'wildchar' (<Tab>) in macros
if has('wildignore')
  set wildignore+=*.o,*.rej,*.so        " Patterns to ignore during file-navigation
endif
if has('wildmenu')
  set wildmenu                          " Show options as list when switching buffers etc
endif
set wildmode=longest:full,full          " Shell-like autocomplete to unambiguous portion

if exists('+winblend')
  set winblend=10                       " Psuedo-transparency for floating windows
endif

set spell                               " Checks for spelling mistakes

if exists('##TextYankPost')
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank('Substitute', 200)
endif
