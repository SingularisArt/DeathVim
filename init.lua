-- Core Settings
require('core.plugins')
require('core.keymappings')
require('core.settings')
require('core.lsp')

-- Plugins
require('plugin-configs.nv-auto-pairs')
require('plugin-configs.nv-airline')
--require('plugin-configs.nv-compe') -- In case you want to use compe instead of cmp
require('plugin-configs.nv-cmp')
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
require('plugin-configs.nv-indent-blankline')

local nightfox = require('nightfox')

-- This function set the configuration of nightfox. If a value is not passed in the setup function
-- it will be taken from the default configuration above
nightfox.setup({
  fox = "duskfox",              -- change the colorscheme to use duskfox
  styles = {
    comments = "italic",        -- change style of comments to be italic
    keywords = "bold",          -- change style of keywords to be bold
    functions = "italic,bold",  -- styles can be a comma separated list
    strings = "italic",         -- change style of strings to be bold
    variables = "bold",         -- change style of variables to be italic
  },
  inverse = {
    match_paren = false, -- inverse the highlighting of match_parens
  },
  colors = {
    red = "#FF000", -- Override the red color for MAX POWER
    bg_alt = "#000000",
  },
  hlgroups = {
    TSPunctDelimiter = { fg = "${red}" }, -- Override a highlight group with the color red
    LspCodeLens = { bg = "#000000", style = "italic" },
  }
})

-- Load the configuration set above and apply the colorscheme
nightfox.load()

vim.cmd [[
  hi LspDiagnosticsFloatError guifg=#db4b4b

  hi LspDiagnosticsFloatWarn guifg=#e0af68

  hi LspDiagnosticsFloatInfor guifg=#0db9d7

  hi LspDiagnosticsFloatHint guifg=#10b981

  hi SignColumn ctermbg=None guibg=None
  hi Normal ctermfg=None guifg=None guibg=None
]]

require('lualine').setup{
  options = { theme = 'nightfox' }
}

  --hi LspDiagnosticsUnderlineError guifg=#db4b4b
  --hi LspDiagnosticsUnderlineWarning guifg=#e0af68
  --hi LspDiagnosticsUnderlineInformation guifg=#0db9d7
  --hi LspDiagnosticsUnderlineHint guifg=#10b981
