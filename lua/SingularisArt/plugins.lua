local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { 'wbthomason/packer.nvim' }

  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'windwp/nvim-autopairs' }
  use { 'numToStr/Comment.nvim' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'kyazdani42/nvim-tree.lua' }
  use { 'akinsho/bufferline.nvim' }
  use { 'moll/vim-bbye' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'akinsho/toggleterm.nvim' }
  use { 'ahmedkhalf/project.nvim' }
  use { 'lewis6991/impatient.nvim' }
  use { 'lukas-reineke/indent-blankline.nvim' }
  use { 'goolord/alpha-nvim' }
  use { 'antoinemadec/FixCursorHold.nvim' }
  use { 'folke/which-key.nvim' }

  -- Colorschemes
  use { 'chriskempson/base16-vim' }
  use { 'AlphaTechnolog/pywal.nvim' }
  use { 'dylanaraps/wal.vim' }
  use { 'EdenEast/nightfox.nvim' }
  use { 'lunarvim/colorschemes' }
  use { 'lunarvim/darkplus.nvim' }
  use { 'lilydjwg/colorizer' }
  use { 'tjdevries/colorbuddy.nvim' }

  -- CMP plugins
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'hrsh7th/cmp-calc' }
  -- use { 'tzachar/cmp-tabnine', run='./install.sh', }
  use { 'quangnguyen30192/cmp-nvim-ultisnips' }
  use { 'kdheepak/cmp-latex-symbols' }

  -- Snippets
  use { 'SirVer/UltiSnips' }
  use { 'SingularisArt/snippets' }

  -- Syntax highlighting
  use { 'neomutt/neomutt.vim' }

  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/nvim-lsp-installer' }
  use { 'tamago324/nlsp-settings.nvim' }
  use { 'jose-elias-alvarez/null-ls.nvim' }
  use { 'onsails/lspkind-nvim' }
  use { 'tami5/lspsaga.nvim' }
  use { 'folke/trouble.nvim' }
  use { 'simrat39/symbols-outline.nvim' }
  use { 'ray-x/navigator.lua' }
  use { 'ray-x/guihua.lua' }
  use { 'ray-x/lsp_signature.nvim' }
  use { 'rmagatti/goto-preview' }

  -- Debugging
  use { 'mfussenegger/nvim-dap' }
  use { 'rcarriga/nvim-dap-ui' }
  use { 'theHamsta/nvim-dap-virtual-text' }
  use { 'Pocco81/dap-buddy.nvim' }
  use { 'mfussenegger/nvim-dap-python' }
  use { 'nvim-telescope/telescope-dap.nvim' }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-file-browser.nvim' }
  use { 'nvim-telescope/telescope-fzy-native.nvim' }
  use { 'nvim-telescope/telescope-ui-select.nvim' }
  use { 'nvim-telescope/telescope-media-files.nvim' }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use { 'nvim-treesitter/playground' }
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }

  -- Git
  use { 'lewis6991/gitsigns.nvim' }
  use { 'tpope/vim-rhubarb' }
  use { 'tpope/vim-fugitive' }

  -- LaTeX
  use { 'lervag/vimtex' }
  use { 'KeitaNakamura/tex-conceal.vim' }
  use { 'anufrievroman/vim-tex-kawaii' }

  -- Rust
  use { 'simrat39/rust-tools.nvim' }

  -- JavaScript
  use { 'pangloss/vim-javascript' }
  use { 'leafgarland/typescript-vim' }
  use { 'MaxMEllon/vim-jsx-pretty' }
  use { 'peitalin/vim-jsx-typescript' }

  -- CSS

  -- HTML
  use { 'mattn/emmet-vim' } -- Fast typing
  use { 'Valloric/MatchTagAlways' } -- Highlight the closing tag
  use { 'alvan/vim-closetag' } -- Auto close tags

  -- Solidity
  use { 'TovarishFin/vim-solidity' }

  -- Markdown
  use { 'ferrine/md-img-paste.vim' }
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && npm install' } -- View markdown
  use { 'preservim/vim-markdown' }

  -- Other
  use { 'wakatime/vim-wakatime' } -- Monitor how much coding I do
  use { 'rhysd/vim-grammarous' }
  use { 'github/copilot.vim' } -- AI suggestions
  use { 'folke/zen-mode.nvim' } -- Distraction free writing
  use { 'folke/twilight.nvim' } -- Highlight certain lines
  use { 'wincent/pinnacle' }
  use { 'scrooloose/nerdcommenter' }
  use { 'easymotion/vim-easymotion' }
  use { 'tpope/vim-surround' }
  use { 'NvChad/nvim-base16.lua' }
  use { 'kdheepak/lazygit.nvim' }
  use { 'voldikss/vim-translator' }
  use { 'dhruvasagar/vim-table-mode' }
  use { 'p00f/nvim-ts-rainbow' }
  use { 'machakann/vim-highlightedyank' }
  use { 'marcushwz/nvim-workbench' }
  use { 'booperlv/nvim-gomove' }
  use { 'mg979/vim-visual-multi' }
  use { 'mbbill/undotree' }
  use { 'AndrewRadev/splitjoin.vim' }
  use { 'ThePrimeagen/refactoring.nvim' }
  use { 'mtdl9/vim-log-highlighting' }
  use { 'windwp/nvim-ts-autotag' }
  use { 'folke/lua-dev.nvim' }
  use { 'turbio/bracey.vim' }
  use { 'danymat/neogen' }
  use { 'haya14busa/is.vim' }
  use { 'mhinz/vim-grepper' }
  use { 'nelstrom/vim-visual-star-search' }
  use { 'duane9/nvim-rg' }
  use { 'folke/todo-comments.nvim' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
