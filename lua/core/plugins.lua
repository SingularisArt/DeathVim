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
  use { 'jose-elias-alvarez/null-ls.nvim' }
  use { 'kabouzeid/nvim-lspinstall' }
  use { 'onsails/lspkind-nvim' }
  use { 'onsails/diaglist.nvim' }
  use { 'glepnir/lspsaga.nvim' }
  use { 'folke/trouble.nvim' }
  use { 'prabirshrestha/vim-lsp' }
  use { 'mattn/vim-lsp-settings' }

  -- Nice syntax
  use { 'sheerun/vim-polyglot' }

  -- Markdown preview
  use { 'iamcco/markdown-preview.nvim'}

  -- Colors
  use { 'lilydjwg/colorizer' }

  -- Telescope
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-fzy-native.nvim' }

  -- Completion & Snippets
  use { 'hrsh7th/nvim-compe' }

  use { 'SirVer/UltiSnips' }
  use { 'honza/vim-snippets' }
  use { 'gillescastel/latex-snippets' }

  -- COC
  --use { 'neoclide/coc.nvim', branch = 'release' }

  -- Distraction free
  use { 'junegunn/goyo.vim' }
  use { 'Pocco81/TrueZen.nvim' }

  -- Commenting
  use { 'scrooloose/nerdcommenter' }

  -- Auto pairs
  use { 'windwp/nvim-autopairs' }

  -- NvimTree and Tagbar
  use { 'kyazdani42/nvim-tree.lua' }
  use { 'preservim/tagbar' }

  -- Colorscheme
  use { 'dylanaraps/wal.vim' }
  use { 'ulwlu/elly.vim' }
  use { 'SingularisArt/uwu.vim' }
  use { 'navarasu/onedark.nvim' }
  use { 'christianchiarulli/nvcode-color-schemes.vim' }
  use { 'nvim-treesitter/nvim-treesitter' }

  -- Whichkey
  use { 'folke/which-key.nvim' }

  -- Icons
  use { 'kyazdani42/nvim-web-devicons' }

  -- Status Line
  --use { 'vim-airline/vim-airline' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'akinsho/bufferline.nvim' }

  -- Dashboard
  use { 'glepnir/dashboard-nvim' }

  -- Terminal
  use { 'voldikss/vim-floaterm' }
  
  -- Nice for lua development
  use { 'folke/lua-dev.nvim' }

  -- Shows an outline with symbols
  use { 'simrat39/symbols-outline.nvim' }

  -- Cooler wildmenu
  use { 'gelguy/wilder.nvim' }

  -- Lazy stuff
  use { 'kdheepak/lazygit.nvim' }

  -- Git signs
  use { 'airblade/vim-gitgutter' }
  use { 'tpope/vim-rhubarb' }
  use { 'tpope/vim-fugitive' }

  -- Nice multi cursors
  use { 'terryma/vim-multiple-cursors' }

  -- For latex
  use { 'lervag/vimtex' }
  use { 'KeitaNakamura/tex-conceal.vim' }
  use { 'anufrievroman/vim-angry-reviewer' }
  use { 'anufrievroman/vim-tex-kawaii' }
  --use { 'matze/vim-tex-fold' }

  -- Translator
  use { 'voldikss/vim-translator' }

  -- Easy tables
  use { 'dhruvasagar/vim-table-mode' }

  -- Quick navigation
  use { 'easymotion/vim-easymotion' }

  -- Minimap
  use { 'rinx/nvim-minimap' }

  -- Scrollbar
  use { 'Xuyuanp/scrollbar.nvim' }

  -- Highlight other words
  use { 'RRethy/vim-illuminate' }
  use { 'chriskempson/base16-vim' }

  -- Shows indentation
  use { 'lukas-reineke/indent-blankline.nvim' }

  -- Fancy quick note taking
  use { 'nvim-neorg/neorg' }

  -- Nice notifications
  use { 'rcarriga/nvim-notify' }

  -- Brackets rainbow
  use { 'frazrepo/vim-rainbow' }

  -- Makes neovim faster
  use { 'lewis6991/impatient.nvim' }

  -- HTML Stuff
  use { 'Valloric/MatchTagAlways' }
  use { 'mattn/emmet-vim' }
end)

