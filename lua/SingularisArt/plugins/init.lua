local cmd = vim.cmd

local present, packer = pcall(require, "packer")

if not present then
  local packer_path = vim.fn.stdpath("data")
    .. "/site/pack/packer/opt/packer.nvim"

  print("Cloning packer..")
  -- remove the dir before cloning
  vim.fn.delete(packer_path, "rf")
  vim.fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    "--depth",
    "20",
    packer_path,
  })

  cmd("packadd packer.nvim")
  present, packer = pcall(require, "packer")

  if present then
    vim.notify("Packer cloned successfully.")
  else
    error("Couldn't clone packer !\nPacker path: " .. packer_path .. "\n" .. packer)
  end
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end,
    prompt_border = "single",
  },
  git = {
    clone_timeout = 600, -- Timeout, in seconds, for git clones
  },
  auto_clean = true,
  compile_on_sync = true,
  auto_reload_compiled = true
})

require('packer').startup({
  function()
    --------------------
    -- Plugin Manager --
    --------------------

    use { 'wbthomason/packer.nvim' }

    ---------------
    -- LSP Stuff --
    ---------------

    use { 'jose-elias-alvarez/null-ls.nvim' }
    use { 'neovim/nvim-lspconfig' }
    use { 'onsails/lspkind-nvim' }
    use { 'tami5/lspsaga.nvim' }
    use { 'williamboman/nvim-lsp-installer' }
    use { 'folke/trouble.nvim' }
    use { 'j-hui/fidget.nvim' }
    use { 'tamago324/nlsp-settings.nvim' }
    use { 'simrat39/symbols-outline.nvim' }

    ----------------
    -- Completion --
    ----------------

    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'quangnguyen30192/cmp-nvim-ultisnips' }
    use { 'github/copilot.vim' }
    use { 'kdheepak/cmp-latex-symbols' }
    use { 'hrsh7th/cmp-emoji' }
    use { 'hrsh7th/cmp-calc' }
    use { 'tzachar/cmp-tabnine', run='./install.sh' }
    use { 'f3fora/cmp-spell' }

    -----------------------------
    -- Language specific tools --
    -----------------------------

    use { 'simrat39/rust-tools.nvim' }
    use { 'KeitaNakamura/tex-conceal.vim' }
    use { 'anufrievroman/vim-tex-kawaii' }
    use { 'Valloric/MatchTagAlways' } use { 'alvan/vim-closetag' }
    use { 'mattn/emmet-vim' }
    use { 'lervag/vimtex' }
    use { 'TovarishFin/vim-solidity' }

    ------------
    -- Colors --
    ------------

    use { 'lilydjwg/colorizer' }
    use { 'nvim-treesitter/playground' }
    use { 'nvim-treesitter/nvim-treesitter' }
    use { 'tjdevries/colorbuddy.nvim' }

    ---------------
    -- Telescope --
    ---------------

    use { 'nvim-telescope/telescope-file-browser.nvim' }
    use { 'nvim-telescope/telescope-fzy-native.nvim' }
    use { 'nvim-telescope/telescope-ui-select.nvim' }
    use { 'nvim-telescope/telescope-media-files.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-telescope/telescope.nvim' }

    --------------
    -- Snippets --
    --------------

    use { 'honza/vim-snippets' }
    use { 'SirVer/UltiSnips' }
    use { 'SingularisArt/custom-snippets' }

    -------------------------
    -- NvimTree and Tagbar --
    -------------------------

    use { 'kyazdani42/nvim-web-devicons' }
    use { 'folke/zen-mode.nvim' }
    use { 'folke/twilight.nvim' }
    use { 'kyazdani42/nvim-tree.lua' }
    use { 'glepnir/dashboard-nvim' }
    use { 'sidebar-nvim/sidebar.nvim' }

    ------------------
    -- Colorschemes --
    ------------------

    use { 'EdenEast/nightfox.nvim' }
    use { 'wincent/pinnacle' }

    -----------------
    -- Status Line --
    -----------------

    use { 'nvim-lualine/lualine.nvim' }
    use { 'nvim-lua/lsp-status.nvim' }
    use { 'akinsho/bufferline.nvim' }

    ---------
    -- Git --
    ---------

    use { 'lewis6991/gitsigns.nvim' }
    use { 'tpope/vim-rhubarb' }
    use { 'tpope/vim-fugitive' }

    ---------
    -- DAP --
    ---------

    use { 'mfussenegger/nvim-dap' }
    use { 'rcarriga/nvim-dap-ui' }
    use { 'theHamsta/nvim-dap-virtual-text' }

    -----------
    -- Other --
    -----------

    use { 'scrooloose/nerdcommenter' }
    use { 'iamcco/markdown-preview.nvim' }
    use { 'easymotion/vim-easymotion' }
    use { 'RRethy/vim-illuminate' }
    use { 'tpope/vim-surround' }
    use { 'NvChad/nvim-base16.lua' }
    use { 'kdheepak/lazygit.nvim' }
    use { 'ahmedkhalf/project.nvim' }
    use { 'folke/which-key.nvim' }
    use { 'voldikss/vim-translator' }
    use { 'dhruvasagar/vim-table-mode' }
    use { 'lukas-reineke/indent-blankline.nvim' }
    use { 'windwp/nvim-autopairs' }
    use { 'akinsho/toggleterm.nvim' }
    use { 'rcarriga/nvim-notify' }
    use { 'p00f/nvim-ts-rainbow' }
    use { 'numToStr/Comment.nvim' }
    use { 'kkoomen/vim-doge', run='call doge#install()' }
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
  end,
})

-- Source all files in the plugins config directory without manually sourcing
-- each one.
-- local home = os.getenv('HOME')
-- local paths = vim.split(vim.fn.glob(home .. '/.config/nvim/lua/SingularisArt/plugins/*.lua'), '\n')
--
-- for _, file in pairs(paths) do
--   vim.cmd('source ' .. file)
-- end

return SingularisArt.autoload('SingularisArt.plugins')

