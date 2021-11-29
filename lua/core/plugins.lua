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

  -- LSP Stuff
  use { 'neovim/nvim-lspconfig' }
  use { 'tamago324/nlsp-settings.nvim' }
  --use { 'jose-elias-alvarez/null-ls.nvim' }
  use { 'kabouzeid/nvim-lspinstall' }
  use { 'onsails/lspkind-nvim' }
  --use { 'onsails/diaglist.nvim' }
  use { 'tami5/lspsaga.nvim', branch='nvim51' }
  --use { 'folke/trouble.nvim' }
  --use { 'prabirshrestha/vim-lsp' }
  --use { 'mattn/vim-lsp-settings' }

  -- Nice syntax
  use { 'sheerun/vim-polyglot' }
  use { 'numirias/semshi' }
  use { 'bfrg/vim-cpp-modern' }
  use { 'billyvg/tigris.nvim' }

  -- Markdown preview
  use { 'iamcco/markdown-preview.nvim'}

  -- Colors
  use { 'lilydjwg/colorizer' }

  -- Telescope
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-fzy-native.nvim' }

  -- Completion
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  --use { 'hrsh7th/cmp-nvim-lua' }
  --use { 'tamago324/cmp-zsh' }

  -- Snippets
  use { 'SirVer/UltiSnips' }
  use { 'honza/vim-snippets' }
  use { 'gillescastel/latex-snippets' }

  -- Distraction free
  use { 'Pocco81/TrueZen.nvim' }

  -- Commenting
  use { 'scrooloose/nerdcommenter' }

  -- Auto pairs
  use { 'windwp/nvim-autopairs' }

  -- NvimTree and Tagbar
  use { 'kyazdani42/nvim-tree.lua' }
  use { 'preservim/tagbar' }

  -- Colorscheme
  use { 'nvim-treesitter/nvim-treesitter' }
  use { 'EdenEast/nightfox.nvim' }

  -- Whichkey
  use { 'folke/which-key.nvim' }

  -- Icons
  use { 'kyazdani42/nvim-web-devicons' }

  -- Status Line
  use { 'nvim-lualine/lualine.nvim' }
  use { 'akinsho/bufferline.nvim' }

  -- Dashboard
  use { 'glepnir/dashboard-nvim' }

  -- Shows an outline with symbols
  use { 'simrat39/symbols-outline.nvim' }

  -- Git signs
  use { 'airblade/vim-gitgutter' }
  use { 'tpope/vim-rhubarb' }
  use { 'tpope/vim-fugitive' }

  -- For latex
  use { 'lervag/vimtex' }
  use { 'KeitaNakamura/tex-conceal.vim' }
  use { 'anufrievroman/vim-angry-reviewer' }
  use { 'anufrievroman/vim-tex-kawaii' }

  -- Translator
  use { 'voldikss/vim-translator' }

  -- Easy tables
  use { 'dhruvasagar/vim-table-mode' }

  -- Quick navigation
  use { 'easymotion/vim-easymotion' }

  -- Minimap
  use { 'rinx/nvim-minimap' }

  -- Highlight other words
  use { 'RRethy/vim-illuminate' }

  -- Shows indentation
  use { 'lukas-reineke/indent-blankline.nvim' }

  -- HTML Stuff
  use { 'Valloric/MatchTagAlways' }
  use { 'mattn/emmet-vim' }
end)

