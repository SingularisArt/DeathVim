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

  -- Colors
  use { 'norcalli/nvim-colorizer.lua' }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope-media-files.nvim' }

  -- Completion & Snippets
  use { 'hrsh7th/nvim-compe' }
  use { 'SirVer/UltiSnips' }
  use { 'honza/vim-snippets' }
  use { 'gillescastel/latex-snippets' }

  -- Distraction free
  use { 'junegunn/goyo.vim' }

  -- Autopairs
  use { 'windwp/nvim-autopairs' }

  -- NvimTree
  use { 'kyazdani42/nvim-tree.lua' }

  -- Colorscheme
  use { 'dylanaraps/wal.vim' }

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
  use { 'akinsho/nvim-toggleterm.lua' }

  -- Translates things
  use { 'voldikss/vim-translator' }
  
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

  -- View markdown
  use { 'iamcco/markdown-preview.nvim', run = ':mkdp#util#install()' }

  -- Nice multi cursors
  use { 'terryma/vim-multiple-cursors' }

  -- For latex
  use { 'lervag/vimtex' }
  use { 'KeitaNakamura/tex-conceal.vim' }
end)
