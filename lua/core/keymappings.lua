vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Enter>', '<NOP>', { noremap = true, silent = true })

vim.g.mapleader = ' '

-- no hl
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true })

-- explorer
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bk', ':bdelete<CR>', { silent = true })

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- tab switch buffer
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprev<CR>', { noremap = true, silent = true })

-- move selected line / block of text in visual mode
vim.api.nvim_set_keymap('v', 'K', ':move \'<-2<CR>gv-gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'J', ':move \'>+1<CR>gv-gv', { noremap = true, silent = true })

-- spell correction
vim.api.nvim_set_keymap('i', '<C-l>', '<C-g>u<Esc>[s1z=`]a<C-g>u', { noremap = true, silent = true })

-- highlight everything
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-a>', '<Esc>ggVG', { noremap = true, silent = true })

-- windows/panes/tabs/buffers
vim.api.nvim_set_keymap('n', '<Leader>v', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>s', ':split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>o', ':only<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>n', ':tabnew<CR>', { noremap = true, silent = true })
  
-- git
vim.api.nvim_set_keymap('n', '<Leader>gs', ':Gstatus<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gd', ':Gdiffsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gc', ':Gcommit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gp', ':Gpush<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gP', ':Gpull<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gm', ':Gmove<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gM', ':Gmerge<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gb', ':Gbrowse<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gb', ':Gbrowse<CR>', { noremap = true, silent = true })

-- translate
vim.api.nvim_set_keymap('n', '<Leader>rt', ':Translate<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>rw', ':TranslateW<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>rr', ':TranslateR<CR>', { noremap = true, silent = true })

-- vimtex
vim.api.nvim_set_keymap('n', '<Leader>lc', ':VimtexCompile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ls', ':VimtexCompileSelected<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>li', ':VimtexInfo<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>lt', ':VimtexTocToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>lv', ':VimtexView<CR>', { noremap = true, silent = true })

-- markdown
vim.api.nvim_set_keymap('n', '<Leader>mp', ':MarkdownPreview<CR>', { noremap = true, silent = true })

-- inkscape
vim.cmd('source ~/.config/nvim/lua/core/keymappings.vim')

-- table
vim.api.nvim_set_keymap('n', '<Leader>ttt',  ':TableModeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>taf', ':TableAddFormula<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tdr', '<Leader>tdr', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tdc', '<Leader>tdc', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tic', '<Leader>tic', { noremap = true, silent = true })

-- commenting
vim.api.nvim_set_keymap('n', '<Leader>nc', ':call nerdcommenter#Comment(0, "comment")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Leader>nc', ':call nerdcommenter#Comment(1, "comment")<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>nu', ':call nerdcommenter#Comment(0, "uncomment")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Leader>nu', ':call nerdcommenter#Comment(1, "uncomment")<CR>', { noremap = true, silent = true })
