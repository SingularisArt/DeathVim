local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim' }
  use { 'neovim/nvim-lspconfig' }
  use { 'tamago324/nlsp-settings.nvim' }
  use { 'jose-elias-alvarez/null-ls.nvim' }
  use { 'kabouzeid/nvim-lspinstall' }

  -- Colors
  use { 'norcalli/nvim-colorizer.lua' }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope-media-files.nvim' }

  -- Completion & Snippets
  use { 'hrsh7th/nvim-compe' }
  use { 'hrsh7th/vim-vsnip' }
  use { 'rafamadriz/friendly-snippets' }

  -- Autopairs
  use { 'windwp/nvim-autopairs' }

  -- NvimTree
  use { 'kyazdani42/nvim-tree.lua' }
  use { 'lewis6991/gitsigns.nvim' }

  -- Colorscheme
  use { 'dylanaraps/wal.vim' }

  -- Whichkey
  use { 'folke/which-key.nvim' }

  -- Comments
  use { 'terrortylor/nvim-comment' }

  -- vim-rooter
  use { 'airblade/vim-rooter' }

  -- Icons
  use { 'kyazdani42/nvim-web-devicons' }

  -- Status Line and Bufferline
  use { 'vim-airline/vim-airline' }
  use { 'akinsho/nvim-bufferline.lua' }

  -- Debugging
  use { 'mfussenegger/nvim-dap' }

  -- Debugger management
  use { 'Pocco81/DAPInstall.nvim' }

  -- Dashboard
  use { 'ChristianChiarulli/dashboard-nvim' }

  -- Terminal
  use { 'akinsho/nvim-toggleterm.lua' }
end)
