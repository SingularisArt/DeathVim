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

  -- Nice syntax
  use { 'sheerun/vim-polyglot' }

  -- Markdown preview
  use { 'iamcco/markdown-preview.nvim'}

  -- Colors
  use { 'norcalli/nvim-colorizer.lua' }

  -- Telescope
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-fzy-native.nvim' }

  -- Completion & Snippets
  use { 'hrsh7th/nvim-compe' }

  use { 'SirVer/UltiSnips' }
  use { 'honza/vim-snippets' }
  use { 'gillescastel/latex-snippets' }

  -- Distraction free
  use { 'junegunn/goyo.vim' }

  -- Commenting
  use { 'scrooloose/nerdcommenter' }

  -- Auto pairs
  use { 'windwp/nvim-autopairs' }

  -- NvimTree
  use { 'kyazdani42/nvim-tree.lua' }

  -- Colorscheme
  use { 'dylanaraps/wal.vim' }
  use { 'navarasu/onedark.nvim' }

  -- Whichkey
  use { 'folke/which-key.nvim' }

  -- Comments
  use { 'terrortylor/nvim-comment' }

  -- Icons
  use { 'kyazdani42/nvim-web-devicons' }

  -- Status Line
  use { 'vim-airline/vim-airline' }

  -- Dashboard
  use { 'glepnir/dashboard-nvim' }

  -- Terminal
  use { 'voldikss/vim-floaterm' }
  
  -- Nice for lua development
  use { 'folke/lua-dev.nvim' }

  -- Shows us any errors
  use { 'folke/trouble.nvim' }

  -- Shows an outline with symbols
  use { 'simrat39/symbols-outline.nvim' }

  -- Cooler wildmenu
  use { 'gelguy/wilder.nvim' }

  -- Lazy stuff
  use { 'kdheepak/lazygit.nvim' }

  -- Git signs
  use { 'airblade/vim-gitgutter' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-rhubarb' }

  -- Nice multi cursors
  use { 'terryma/vim-multiple-cursors' }

  -- For latex
  use { 'lervag/vimtex' }
  use { 'KeitaNakamura/tex-conceal.vim' }

  -- Translator
  use { 'voldikss/vim-translator' }

  -- Easy tables
  use { 'dhruvasagar/vim-table-mode' }

  -- Quick navigation
  use { 'easymotion/vim-easymotion' }
end)
