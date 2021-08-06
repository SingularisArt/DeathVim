call plug#begin('~/.config/nvim/plugged/')

" Helps with html writing
Plug 'mattn/emmet-vim'
Plug 'valloric/MatchTagAlways'

" Lsp completion
Plug 'neovim/nvim-lspconfig'

" Deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'

" Airline
Plug 'deviantfero/wpgtk.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Lets us see the full code
Plug 'majutsushi/tagbar'

" Allows us the see the directory
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'

" Nice fuzzy file finder
Plug 'kien/ctrlp.vim'

" Nice git integreations
Plug 'mhinz/vim-signify' |
      \ Plug 'tpope/vim-fugitive' |
      \ Plug 'tpope/vim-rhubarb' |
      \ Plug 'junegunn/gv.vim'

" Shows us an example of the readme
Plug 'iamcco/markdown-preview.vim'

" Adds nice syntax
Plug 'sheerun/vim-polyglot'

" Paint css colors with the real color
Plug 'lilydjwg/colorizer'

" Auto-closes the brackets
Plug 'cohama/lexima.vim'

" Nice mapping reminders
Plug 'liuchengxu/vim-which-key'

" Opens the terminal in a popup window withen the file ycu are working on
Plug 'voldikss/vim-floaterm'

" Quick commenting
Plug 'tomtom/tcomment_vim'

" Needed for presentation
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Nice startup screen
Plug 'glepnir/dashboard-nvim'
Plug 'liuchengxu/vim-clap'

" Highlights yanked text
Plug 'machakann/vim-highlightedyank'

" Allows for writing tex in vim
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim'

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()

