-- Core Settings
require('core.plugins')
require('core.keymappings')
require('core.settings')
require('core.lsp')

-- Plugins
require('plugin-configs.nv-auto-pairs')
require('plugin-configs.nv-airline')
require('plugin-configs.nv-compe')
require('plugin-configs.nv-bufferline')
require('plugin-configs.nv-nvimtree')
require('plugin-configs.nv-telescope')
require('plugin-configs.nv-terminal')
require('plugin-configs.nv-which-key')
require('plugin-configs.nv-dashboard')
require('plugin-configs.nv-ultisnips')
require('plugin-configs.nv-vimtex')
require('plugin-configs.nv-vim-polyglot')
require('plugin-configs.nv-translator')
require('plugin-configs.nv-table-mode')
require('plugin-configs.nv-which-key')
require('plugin-configs.nv-scrollbar')
require('plugin-configs.nv-wildmenu')
require('plugin-configs.nv-indent-blankline')
require('plugin-configs.nv-neorg')
require('bufferline').setup{}

vim.cmd('color nvcode')
vim.cmd('hi Normal ctermfg=None ctermbg=None guifg=None guibg=None')
vim.cmd('hi SignColumn ctermbg=None guibg=None')

require('lualine').setup{
  options = { theme = 'pywal' }
}
