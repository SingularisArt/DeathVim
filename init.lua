-------------------
-- Core Settings --
-------------------

require('core.plugins')
require('core.keymappings')
require('core.settings')
require('core.lsp')
require('core.tree-sitter')
vim.cmd('source ~/.config/nvim/lua/core/folds.vim')

-------------
-- Plugins --
-------------

require('plugin-configs.airline')
require('plugin-configs.bufferline')
require('plugin-configs.cmp')
require('plugin-configs.nvimtree')
require('plugin-configs.telescope')
require('plugin-configs.terminal')
require('plugin-configs.dashboard')
require('plugin-configs.which-key')
require('plugin-configs.ultisnips')
require('plugin-configs.vimtex')
require('plugin-configs.translator')
require('plugin-configs.table-mode')
require('plugin-configs.which-key')
require('plugin-configs.indent-blankline')
require('plugin-configs.toggleterm')
require('plugin-configs.auto-pairs')
require('plugin-configs.emmet')

require('nvim-treesitter.configs').setup{}
require('lualine').setup{
  options = { theme = 'nightfox' }
}

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
vim.cmd('color duskfox')

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

vim.api.nvim_exec([[
set foldtext=folds#foldtext()
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
]], true)
vim.cmd[[
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
]]
