-------------------
-- Core Settings --
-------------------

require('core.plugins')
require('core.keymappings')
require('core.settings')
require('core.lsp')

vim.cmd('source ~/.config/nvim/lua/core/folds.vim')
vim.cmd('source ~/.config/nvim/lua/core/vim-commands.vim')
