-------------------
-- Core Settings --
-------------------

require('core.plugins')
require('core.keymappings')
require('core.settings')
require('core.lsp')

-------------
-- Plugins --
-------------

require('plugin-configs.nv-auto-pairs')
--require('plugin-configs.nv-compe') -- In case you want to use compe instead of cmp
require('plugin-configs.nv-cmp')
require('plugin-configs.nv-bufferline')
require('plugin-configs.nv-dim-in-active')
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
require('plugin-configs.nv-indent-blankline')
require('neoscroll').setup()
require('lualine').setup{
  options = { theme = 'nightfox' }
}
require('nvim-treesitter.configs').setup{}

------------------
-- Colorscheme --
------------------

local nightfox = require('nightfox')

nightfox.setup({
  fox = 'duskfox',
  transparent = true,
  terminal_colors = true,
  styles = {
    comments = 'italic',
    keywords = 'bold',
    functions = 'italic,bold'
  },
  colors = {
    bg_alt = '#FF0000',
  },
  inverse = {
    match_paren = true,
    visual = false,
    search = false
  },
})

nightfox.load()

------------------
-- Vim commands --
------------------

vim.cmd('hi LspDiagnosticsVirtualTextError          guifg=#db4b4b')
vim.cmd('hi LspDiagnosticsVirtualTextWarning        guifg=#e0af60')
vim.cmd('hi LspDiagnosticsVirtualTextInformation    guifg=#0db9d7')
vim.cmd('hi LspDiagnosticsVirtualTextHint           guifg=#10b981')
vim.cmd('hi SignColumn ctermbg=None                 guibg=None')
vim.cmd('hi Normal ctermfg=None guifg=None          guibg=None')
vim.cmd('hi NormalNC ctermfg=None guifg=None        guibg=None')
vim.cmd('hi NvimTreeNormal guibg=None')

