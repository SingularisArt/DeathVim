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

-- TODO: Organize this better

return packer.startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }
  use { 'SingularisArt/snippets' }
  use { 'jose-elias-alvarez/null-ls.nvim' }
  use { 'neovim/nvim-lspconfig' }
  use { 'onsails/lspkind-nvim' }
  use { 'tami5/lspsaga.nvim' }
  use { 'williamboman/nvim-lsp-installer' }
  use { 'folke/trouble.nvim' }
  use { 'j-hui/fidget.nvim' }
  use { 'tamago324/nlsp-settings.nvim' }
  use { 'simrat39/symbols-outline.nvim' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'quangnguyen30192/cmp-nvim-ultisnips' }
  use { 'github/copilot.vim' }
  use { 'kdheepak/cmp-latex-symbols' }
  use { 'hrsh7th/cmp-calc' }
  use { 'f3fora/cmp-spell' }
  use { 'simrat39/rust-tools.nvim' }
  use { 'KeitaNakamura/tex-conceal.vim' }
  use { 'anufrievroman/vim-tex-kawaii' }
  use { 'Valloric/MatchTagAlways' }
  use { 'alvan/vim-closetag' }
  use { 'mattn/emmet-vim' }
  use { 'lervag/vimtex' }
  use { 'TovarishFin/vim-solidity' }
  use { 'lilydjwg/colorizer' }
  use { 'nvim-treesitter/playground' }
  use { 'nvim-treesitter/nvim-treesitter' }
  use { 'tjdevries/colorbuddy.nvim' }
  use { 'nvim-telescope/telescope-file-browser.nvim' }
  use { 'nvim-telescope/telescope-fzy-native.nvim' }
  use { 'nvim-telescope/telescope-ui-select.nvim' }
  use { 'nvim-telescope/telescope-media-files.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'honza/vim-snippets' }
  use { 'SirVer/UltiSnips' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'folke/zen-mode.nvim' }
  use { 'folke/twilight.nvim' }
  use { 'kyazdani42/nvim-tree.lua' }
  use { 'glepnir/dashboard-nvim' }
  use { 'sidebar-nvim/sidebar.nvim' }
  use { 'EdenEast/nightfox.nvim' }
  use { 'wincent/pinnacle' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'nvim-lua/lsp-status.nvim' }
  use { 'akinsho/bufferline.nvim' }
  use { 'lewis6991/gitsigns.nvim' }
  use { 'tpope/vim-rhubarb' }
  use { 'tpope/vim-fugitive' }
  use { 'mfussenegger/nvim-dap' }
  use { 'rcarriga/nvim-dap-ui' }
  use { 'theHamsta/nvim-dap-virtual-text' }
  use { 'scrooloose/nerdcommenter' }
  use { 'iamcco/markdown-preview.nvim' }
  use { 'easymotion/vim-easymotion' }
  use { 'tpope/vim-surround' }
  use { 'NvChad/nvim-base16.lua' }
  use { 'kdheepak/lazygit.nvim' }
  use { 'ahmedkhalf/project.nvim' }
  use { 'folke/which-key.nvim' }
  use { 'voldikss/vim-translator' }
  use { 'dhruvasagar/vim-table-mode' }
  use { 'windwp/nvim-autopairs' }
  use { 'akinsho/toggleterm.nvim' }
  use { 'rcarriga/nvim-notify' }
  use { 'p00f/nvim-ts-rainbow' }
  use { 'numToStr/Comment.nvim' }
  use { 'machakann/vim-highlightedyank' }
  use { 'marcushwz/nvim-workbench' }
  use { 'wakatime/vim-wakatime' }
  use { 'anuvyklack/pretty-fold.nvim' }
  use { 'petertriho/nvim-scrollbar' }
  use { 'MunifTanjim/nui.nvim' }
  use { 'booperlv/nvim-gomove' }
  use { 'mg979/vim-visual-multi' }
  use { 'mbbill/undotree' }
  use { 'AndrewRadev/splitjoin.vim' }
  use { 'ThePrimeagen/refactoring.nvim' }
  use { 'mtdl9/vim-log-highlighting' }
  use { 'windwp/nvim-ts-autotag' }
  use { 'folke/lua-dev.nvim' }
  use { 'turbio/bracey.vim' }
  use { 'mrjones2014/load-all.nvim' }
  use { 'wincent/command-t' }
  use { 'AlphaTechnolog/pywal.nvim' }
  use { 'danymat/neogen' }
  use { 'TaDaa/vimade' }
  use { 'Pocco81/DAPInstall.nvim' }
  use { 'mfussenegger/nvim-dap-python' }
  use { 'vim-test/vim-test' }
  use { 'rcarriga/vim-ultest' }
  use { 'kkvh/vim-docker-tools' }
  use { 'jamestthompson3/nvim-remote-containers' }
  use { 'wincent/corpus' }
  use { 'chriskempson/base16-vim' }
  use { 'haya14busa/is.vim' }
  use { 'mhinz/vim-grepper' }
  use { 'nelstrom/vim-visual-star-search' }
  use { 'wincent/replay' }
  use { 'wincent/ferret' }
  use { 'duane9/nvim-rg' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'rafamadriz/friendly-snippets' }
  use { 'ellisonleao/gruvbox.nvim' }
  use { 'christoomey/vim-tmux-navigator' }
  use { 'kiteco/vim-plugin' }
  use { 'SingularisArt/vscode_sidebar.nvim' }
  use { 'nekonako/xresources-nvim' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'lukas-reineke/indent-blankline.nvim' }
  use { 'folke/todo-comments.nvim' }
  use { 'narutoxy/dim.lua' }
  use { 'glacambre/firenvim' }
  use { 'ray-x/lsp_signature.nvim' }
  use { 'rmagatti/goto-preview' }
  use { 'jubnzv/virtual-types.nvim' }
  use { 'ldelossa/litee.nvim' }
  use { 'ldelossa/litee-bookmarks.nvim' }
  use { 'ldelossa/litee-filetree.nvim' }
  use { 'ldelossa/litee-calltree.nvim' }
  use { 'ldelossa/litee-symboltree.nvim' }
  use { 'ray-x/navigator.lua' }
  use { 'ray-x/guihua.lua' }
  use { 'folke/lsp-colors.nvim' }
  use { 'kosayoda/nvim-lightbulb' }
  use { 'jjohnson338/deoplete-mssql' }
  use { 'kristijanhusak/vim-dadbod-ui' }
  use { 'tpope/vim-dadbod' }
  use { 'kristijanhusak/vim-dadbod-completion' }
  use { 'nanotee/sqls.nvim' }
  use { 'nvim-neo-tree/neo-tree.nvim' }
  use { 'SmiteshP/nvim-gps' }
  use { 'mfussenegger/nvim-jdtls' }
  use { 'jbyuki/one-small-step-for-vimkind' }
  use { 'smjonas/snippet-converter.nvim' }
  use { 'pangloss/vim-javascript' }
  use { 'leafgarland/typescript-vim' }
  use { 'MaxMEllon/vim-jsx-pretty' }
  use { 'peitalin/vim-jsx-typescript' }
end)
