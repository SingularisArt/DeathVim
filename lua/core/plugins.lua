local cmd = vim.cmd

local present, packer = pcall(require, "packer")

local config = {
  nvim_cmp =                  "plugin-configs.cmp",
  vimtex =                    "plugin-configs.vimtex",
  emmet_vim =                 "plugin-configs.emmet",
  telescope_nvim =            "plugin-configs.telescope",
  UltiSnips =                 "plugin-configs.ultisnips",
  nvim_tree_lua =             "plugin-configs.nvimtree",
  dashboard_nvim =            "plugin-configs.dashboard",
  bufferline_nvim =           "plugin-configs.bufferline",
  nvim_autopairs =            "plugin-configs.auto-pairs",
  which_key_nvim =            "plugin-configs.which-key",
  vim_translator =            "plugin-configs.translator",
  vim_table_mode =            "plugin-configs.table-mode",
  indent_blankline_nvim =     "plugin-configs.indent-blankline",
  toggleterm_nvim =           "plugin-configs.toggleterm",
  nvim_notify =               "plugin-configs.notify",
  nightfox_nvim =             "plugin-configs.nightfox",
  nvim_treesitter =           "plugin-configs.nvim-treesitter",
  feline_nvim =               "plugin-configs.statusbar",
  project_nvim =              "plugin-configs.project",
  trouble =                   "plugin-configs.trouble",
  gitsigns =                  "plugin-configs.gitsigns",
  ts_rainbow =                "plugin-configs.ts-rainbow",
  better_escape_nvim =        "plugin-configs.better-escape",
  comment_nvim =              "plugin-configs.comment-nvim",
}

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
    print("Packer cloned successfully.")
  else
    error(
      "Couldn't clone packer !\nPacker path: " .. packer_path .. "\n" .. packer
    )
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
  --    auto_reload_compiled = true
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

    use { 'neovim/nvim-lspconfig' }
    use { 'onsails/lspkind-nvim' }
    use { 'tami5/lspsaga.nvim' }
    use { 'williamboman/nvim-lsp-installer' }
    use { 'folke/trouble.nvim' }

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
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'kdheepak/cmp-latex-symbols' }
    use { 'petertriho/cmp-git' }
    use { 'hrsh7th/cmp-emoji' }
    use { 'hrsh7th/cmp-calc' }
    use { 'pontusk/cmp-vimwiki-tags' }
    use { 'fiorematteo/cmp-katex' }
    use { 'max397574/cmp-greek' }
    use { 'dmitmel/cmp-cmdline-history' }
    use { 'aspeddro/cmp-pandoc.nvim' }
    use { 'tamago324/cmp-zsh' }
    use { 'quangnguyen30192/cmp-nvim-tags' }
    use { 'tzachar/cmp-tabnine', run='./install.sh' }
    use { 'f3fora/cmp-spell' }

    -----------------------------
    -- Language specific tools --
    -----------------------------

    use { 'simrat39/rust-tools.nvim' }
    use { 'KeitaNakamura/tex-conceal.vim' }
    use { 'anufrievroman/vim-angry-reviewer' }
    use { 'anufrievroman/vim-tex-kawaii' }
    use { 'Valloric/MatchTagAlways' }
    use { 'alvan/vim-closetag' }
    use { 'lervag/vimtex' }
    use { 'mattn/emmet-vim' }
    ------------
    -- Colors --
    ------------

    use { 'tomlion/vim-solidity' }
    use { 'lilydjwg/colorizer' }
    use { 'nvim-treesitter/playground' }
    use { 'Shatur/neovim-ayu' }
    use { 'ray-x/aurora' }
    use { 'tomasiser/vim-code-dark' }
    use { 'nvim-treesitter/nvim-treesitter' }
    use { 'tjdevries/colorbuddy.nvim' }

    ---------------
    -- Telescope --
    ---------------

    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { 'nvim-telescope/telescope-fzy-native.nvim' }
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

    use { 'preservim/tagbar' }
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'simrat39/symbols-outline.nvim' }
    use { 'folke/zen-mode.nvim' }
    use { 'folke/twilight.nvim' }
    use { 'kyazdani42/nvim-tree.lua' }
    use { 'glepnir/dashboard-nvim' }

    ------------------
    -- Colorschemes --
    ------------------

    use { 'overcache/NeoSolarized' }
    use { 'EdenEast/nightfox.nvim' }

    -----------------
    -- Status Line --
    -----------------

    use { 'feline-nvim/feline.nvim' }
    use { 'akinsho/bufferline.nvim' }

    ---------
    -- Git --
    ---------

    use { 'lewis6991/gitsigns.nvim' }
    use { 'tpope/vim-rhubarb' }
    use { 'tpope/vim-fugitive' }

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
    use { 'mortepau/codicons.nvim' }
    use { 'ahmedkhalf/project.nvim' }
    use { 'folke/which-key.nvim' }
    use { 'voldikss/vim-translator' }
    use { 'dhruvasagar/vim-table-mode' }
    use { 'lukas-reineke/indent-blankline.nvim' }
    use { 'windwp/nvim-autopairs' }
    use { 'akinsho/toggleterm.nvim' }
    use { 'rcarriga/nvim-notify' }
    use { 'p00f/nvim-ts-rainbow' }
    use { 'max397574/better-escape.nvim' }
    use { 'numToStr/Comment.nvim' }
    use { 'rinx/nvim-minimap' }
    use { 'kkoomen/vim-doge', run='call doge#install()' }
  end,
})


---------------------------
-- Require plugin config --
---------------------------

require(config.nvim_cmp)
require(config.trouble)
require(config.emmet_vim)
require(config.vimtex)
require(config.nvim_treesitter)
require(config.telescope_nvim)
require(config.UltiSnips)
require(config.nvim_tree_lua)
require(config.dashboard_nvim)
require(config.nightfox_nvim)
require(config.feline_nvim)
require(config.bufferline_nvim)
require(config.gitsigns)
require(config.project_nvim)
require(config.which_key_nvim)
require(config.vim_translator)
require(config.vim_table_mode)
require(config.indent_blankline_nvim)
require(config.nvim_autopairs)
require(config.toggleterm_nvim)
require(config.nvim_notify)
require(config.ts_rainbow)
require(config.better_escape_nvim)
require(config.comment_nvim)
require('zen-mode')
require('twilight')

