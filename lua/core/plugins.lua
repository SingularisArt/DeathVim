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
  better_escape_nvim =        "plugin-configs.better-escape"
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

return require('packer').startup({
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
    use { 'folke/trouble.nvim', config=require(config.trouble) }

    ----------------
    -- Completion --
    ----------------

    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'quangnguyen30192/cmp-nvim-ultisnips' }
    use { 'github/copilot.vim' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'hrsh7th/nvim-cmp', config=require(config.nvim_cmp) }

    -----------------------------
    -- Language specific tools --
    -----------------------------

    use { 'simrat39/rust-tools.nvim' }
    use { 'KeitaNakamura/tex-conceal.vim' }
    use { 'anufrievroman/vim-angry-reviewer' }
    use { 'anufrievroman/vim-tex-kawaii' }
    use { 'Valloric/MatchTagAlways' }
    use { 'alvan/vim-closetag' }
    use { 'lervag/vimtex', config=require(config.vimtex) }
    use { 'mattn/emmet-vim', config=require(config.emmet_vim) }

    ------------
    -- Colors --
    ------------

    use { 'tomlion/vim-solidity' }
    use { 'lilydjwg/colorizer' }
    use { 'nvim-treesitter/playground' }
    use { 'nvim-treesitter/nvim-treesitter', config=require(config.nvim_treesitter) }

    ---------------
    -- Telescope --
    ---------------

    use { 'nvim-telescope/telescope-fzy-native.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-telescope/telescope.nvim', config=require(config.telescope_nvim) }

    --------------
    -- Snippets --
    --------------

    use { 'honza/vim-snippets' }
    use { 'SirVer/UltiSnips', config=require(config.UltiSnips) }

    -------------------------
    -- NvimTree and Tagbar --
    -------------------------

    use { 'preservim/tagbar' }
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'simrat39/symbols-outline.nvim' }
    use { 'Pocco81/TrueZen.nvim' }
    use { 'kyazdani42/nvim-tree.lua', config=require(config.nvim_tree_lua) }
    use { 'glepnir/dashboard-nvim', config=require(config.dashboard_nvim) }

    ------------------
    -- Colorschemes --
    ------------------

    use { 'overcache/NeoSolarized' }
    use { 'EdenEast/nightfox.nvim', config=require(config.nightfox_nvim) }

    -----------------
    -- Status Line --
    -----------------

    use { 'feline-nvim/feline.nvim', config=require(config.feline_nvim) }
    use { 'akinsho/bufferline.nvim', config=require(config.bufferline_nvim) }

    ---------
    -- Git --
    ---------

    use { 'lewis6991/gitsigns.nvim', config=require(config.gitsigns) }
    use { 'tpope/vim-rhubarb' }
    use { 'tpope/vim-fugitive' }

    -----------
    -- Other --
    -----------

    use { 'scrooloose/nerdcommenter' }
    use { 'iamcco/markdown-preview.nvim' }
    use { 'easymotion/vim-easymotion' }
    --use { 'rinx/nvim-minimap' }
    --use { 'RRethy/vim-illuminate' }
    --use { 'karb94/neoscroll.nvim' }
    use { 'tpope/vim-surround' }
    --use { 'folke/twilight.nvim' }
    --use { 'junegunn/limelight.vim' }
    use { 'NvChad/nvim-base16.lua' }
    use { 'kdheepak/lazygit.nvim' }
    use { 'ahmedkhalf/project.nvim', config=require(config.project_nvim) }
    use { 'folke/which-key.nvim', config=require(config.which_key_nvim) }
    use { 'voldikss/vim-translator', config=require(config.vim_translator) }
    use { 'dhruvasagar/vim-table-mode', config=require(config.vim_table_mode) }
    use { 'lukas-reineke/indent-blankline.nvim', config=require(config.indent_blankline_nvim) }
    use { 'windwp/nvim-autopairs', config=require(config.nvim_autopairs) }
    use { 'akinsho/toggleterm.nvim', config=require(config.toggleterm_nvim) }
    use { 'rcarriga/nvim-notify', config=require(config.nvim_notify) }
    use { 'p00f/nvim-ts-rainbow', config=require(config.ts_rainbow) }
    use { 'max397574/better-escape.nvim', config=require(config.better_escape_nvim) }
  end,
})

