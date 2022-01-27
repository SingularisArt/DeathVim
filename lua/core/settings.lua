vim.opt.encoding          = 'utf-8'
vim.opt.fileencoding      = 'utf-8'
vim.opt.mouse             = 'a'
vim.opt.background        = 'dark'
vim.opt.signcolumn        = 'yes'
vim.opt.clipboard         = 'unnamedplus'
vim.opt.colorcolumn       = '80'
vim.o.shortmess           = vim.o.shortmess .. 'c'
vim.opt.spelllang         = { 'en_us' }

vim.cmd("set timeoutlen=1")
vim.opt.pumheight         = 10
vim.opt.cmdheight         = 2
vim.opt.conceallevel      = 2
vim.opt.tabstop           = 2
vim.opt.shiftwidth        = 2
vim.opt.laststatus        = 2
vim.opt.showtabline       = 2
vim.opt.updatetime        = 50
vim.opt.scrolloff         = 8
vim.opt.textwidth         = 80

vim.opt.hidden            = true
vim.opt.wrap              = true
vim.opt.ruler             = true
vim.opt.splitbelow        = true
vim.opt.splitright        = true
vim.opt.smarttab          = true
vim.opt.expandtab         = true
vim.opt.smartindent       = true
vim.opt.autoindent        = true
vim.opt.smartcase         = true
vim.opt.ignorecase        = true
vim.opt.showmode          = false
vim.opt.writebackup       = false
vim.opt.incsearch         = true
vim.opt.hlsearch          = false
vim.opt.errorbells        = false
vim.opt.wrap              = false
vim.opt.swapfile          = false
vim.opt.undofile          = false
vim.opt.backup            = false
vim.opt.spell             = true


vim.opt.termguicolors     = true

vim.wo.number             = true
vim.wo.relativenumber     = true
vim.wo.cursorline         = true

vim.cmd('au TermOpen * setlocal nospell')
vim.cmd('set spell')
vim.cmd('if !has("nvim") | set viminfofile=$XDG_STATE_HOME/vim/viminfo | endif')
