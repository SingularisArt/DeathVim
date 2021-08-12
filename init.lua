-- Core Settings
require('core.plugins')
require('core.keymappings')
require('core.settings')
require('core.colorscheme')

-- Plugins
require('plugin-configs.nv-airline')
require('plugin-configs.nv-compe')
require('plugin-configs.nv-colorizer')
require('plugin-configs.nv-nvimtree')
require('plugin-configs.nv-telescope')
require('plugin-configs.nv-terminal')
require('plugin-configs.nv-which-key')
require('plugin-configs.nv-dashboard')

-- LSP
require('lsp.lua-ls')