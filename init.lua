-------------------
-- Core Settings --
-------------------

vim.cmd('source ~/.config/nvim/lua/core/folds.vim')
vim.cmd('source ~/.config/nvim/lua/core/vim-commands.vim')

require('core.settings')
require('core.keymappings')
require('core.plugins')
require('core.lsp')

