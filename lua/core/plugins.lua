local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

local commit = {
  packer =                    "851c62c5ecd3b5adc91665feda8f977e104162a5",
  nvim_lspconfig =            "d285f720ed2b26b687a06e9c7d5d41353dd2b743",
  lspkind_nvim =              "f0d1552890e384f15b47ea88bd1b8a077cddc24a",
  lspsaga_nvim =              "cb0e35d2e594ff7a9c408d2e382945d56336c040",
  nvim_lsp_installer =        "57398ee78d055b3fc566092c1a09ca8df9df1d71",
  nvim_cmp =                  "96c392dee3f8f04f90cc56ff752a18b5a915e869",
  cmp_cmdline =               "29ca81a6f0f288e6311b3377d9d9684d22eac2ec",
  cmp_buffer =                "f83773e2f433a923997c5faad7ea689ec24d1785",
  cmp_path =                  "4d58224e315426e5ac4c5b218ca86cab85f80c79",
  cmp_nvim_lsp =              "b4251f0fca1daeb6db5d60a23ca81507acf858c2",
  cmp_nvim_ultisnips =        "f4eedd097fba15262a938aab6d875af9f23e55b3",
  copilot_vim =               "c01314840b94da0b9767b52f8a4bbc579214e509",
  rust_tools_nvim =           "7eb435069b307f55bdc3aa27bd3fe4ad704e66db",
  vim_jdaddy =                "5cffddb8e644d3a3d0c0ee6a7abf5b713e3c4f97",
  csv_vim =                   "9ab092187a7046a8d0eedc7fbbce8fac38d10563",
  vimtex =                    "525db53991e5f51668c86e2359aa31c6b3a2a226",
  tex_conceal_vim =           "822712d80b4ad5bc5c241ab0a778ede812ec501f",
  vim_angry_reviewer =        "2f41d2965f16ba019d06bf8dc8f970ce92e4db8c",
  vim_tex_kawaii =            "bb5473c0e9a1f70ab52b49075e8dacf21dbf6a0e",
  MatchTagAlways =            "352eb479a4ad1608e0880b79ab2357aac2cf4bed",
  emmet_vim =                 "def5d57a1ae5afb1b96ebe83c4652d1c03640f4d",
  vim_closetag =              "c0779ef575d5c239162f4ca3506cfb4a95d45a58",
  vim_solidity =              "569bbbedc3898236d5912fed0caf114936112ae4",
  colorizer =                 "72790a003d5a706c287486a1a81e3a6b32158b54",
  nvim_treesitter =           "b5cdb868c7a20640c9b60aa82afe82ed63f4ebd3",
  playground =                "787a7a8d4444e58467d6b3d4b88a497e7d494643",
  telescope_nvim =            "c54fc1733e440ebe730f68a838c54c7c7e70e6fd",
  telescope_fzy_native_nvim = "7b3d2528102f858036627a68821ccf5fc1d78ce4",
  plenary_nvim =              "563d9f6d083f0514548f2ac4ad1888326d0a1c66",
  UltiSnips =                 "2c83e40ce66814bf813457bb58ea96184ab9bb81",
  vim_snippets =              "d253ed3b5d32ce00370ad2c0deffd6e8e482cf2d",
  latex_snippets =            "",
  nvim_tree_lua =             "",
  tagbar =                    "",
  nvim_web_devicons =         "",
  dashboard_nvim =            "",
  symbols_outline_nvim =      "",
  TrueZen_nvim =              "",
  nightfox_nvim =             "",
  NeoSolarized =              "",
  lualine_nvim =              "",
  bufferline_nvim =           "",
  vim_gitgutter =             "",
  vim_rhubarb =               "",
  vim_fugitive =              "",
  nerdcommenter =             "",
  nvim_autopairs =            "",
  markdown_preview_nvim =     "",
  which_key_nvim =            "",
  vim_translator =            "",
  vim_table_mode =            "",
  vim_easymotion =            "",
  nvim_minimap =              "",
  vim_illuminate =            "",
  indent_blankline_nvim =     "",
  neoscroll_nvim =            "",
  vim_surround =              "",
  twilight_nvim =             "",
  limelight_vim =             "",
  toggleterm_nvim =           "",
  shade_nvim =                "",
}

local branch = {
  packer =                    "master",
  nvim_lspconfig =            "",
  lspkind_nvim =              "",
  lspsaga_nvim =              "",
  nvim_lsp_installer =        "",
  nvim_cmp =                  "",
  cmp_cmdline =               "",
  cmp_buffer =                "",
  cmp_path =                  "",
  cmp_nvim_lsp =              "",
  cmp_nvim_ultisnips =        "",
  copilot_vim =               "",
  rust_tools_nvim =           "",
  vim_jdaddy =                "",
  csv_vim =                   "",
  vimtex =                    "",
  tex_conceal_vim =           "",
  vim_angry_reviewer =        "",
  vim_tex_kawaii =            "",
  MatchTagAlways =            "",
  emmet_vim =                 "",
  vim_closetag =              "",
  vim_solidity =              "",
  colorizer =                 "",
  nvim_treesitter =           "",
  playground =                "",
  telescope_nvim =            "",
  telescope_fzy_native_nvim = "",
  plenary_nvim =              "",
  UltiSnips =                 "",
  vim_snippets =              "",
  latex_snippets =            "",
  nvim_tree_lua =             "",
  tagbar =                    "",
  nvim_web_devicons =         "",
  dashboard_nvim =            "",
  symbols_outline_nvim =      "",
  TrueZen_nvim =              "",
  nightfox_nvim =             "",
  NeoSolarized =              "",
  lualine_nvim =              "",
  bufferline_nvim =           "",
  vim_gitgutter =             "",
  vim_rhubarb =               "",
  vim_fugitive =              "",
  nerdcommenter =             "",
  nvim_autopairs =            "",
  markdown_preview_nvim =     "",
  which_key_nvim =            "",
  vim_translator =            "",
  vim_table_mode =            "",
  vim_easymotion =            "",
  nvim_minimap =              "",
  vim_illuminate =            "",
  indent_blankline_nvim =     "",
  neoscroll_nvim =            "",
  vim_surround =              "",
  twilight_nvim =             "",
  limelight_vim =             "",
  toggleterm_nvim =           "",
  shade_nvim =                "",
}

local disable = {
  packer =                    false,
  nvim_lspconfig =            false,
  lspkind_nvim =              false,
  lspsaga_nvim =              false,
  nvim_lsp_installer =        false,
  nvim_cmp =                  false,
  cmp_cmdline =               false,
  cmp_buffer =                false,
  cmp_path =                  false,
  cmp_nvim_lsp =              false,
  cmp_nvim_ultisnips =        false,
  copilot_vim =               false,
  rust_tools_nvim =           false,
  vim_jdaddy =                false,
  csv_vim =                   false,
  vimtex =                    false,
  tex_conceal_vim =           false,
  vim_angry_reviewer =        false,
  vim_tex_kawaii =            false,
  MatchTagAlways =            false,
  emmet_vim =                 false,
  vim_closetag =              false,
  vim_solidity =              false,
  colorizer =                 false,
  nvim_treesitter =           false,
  playground =                false,
  telescope_nvim =            false,
  telescope_fzy_native_nvim = false,
  plenary_nvim =              false,
  UltiSnips =                 false,
  vim_snippets =              false,
  latex_snippets =            false,
  nvim_tree_lua =             false,
  tagbar =                    false,
  nvim_web_devicons =         false,
  dashboard_nvim =            false,
  symbols_outline_nvim =      false,
  TrueZen_nvim =              false,
  nightfox_nvim =             false,
  NeoSolarized =              false,
  lualine_nvim =              false,
  bufferline_nvim =           false,
  vim_gitgutter =             false,
  vim_rhubarb =               false,
  vim_fugitive =              false,
  nerdcommenter =             false,
  nvim_autopairs =            false,
  markdown_preview_nvim =     false,
  which_key_nvim =            false,
  vim_translator =            false,
  vim_table_mode =            false,
  vim_easymotion =            false,
  nvim_minimap =              false,
  vim_illuminate =            false,
  indent_blankline_nvim =     false,
  neoscroll_nvim =            false,
  vim_surround =              false,
  twilight_nvim =             false,
  limelight_vim =             false,
  toggleterm_nvim =           false,
  shade_nvim =                false,
}

local config = {
  packer =                    "",
  nvim_lspconfig =            "",
  lspkind_nvim =              "",
  lspsaga_nvim =              "",
  nvim_lsp_installer =        "",
  nvim_cmp =                  "",
  cmp_cmdline =               "",
  cmp_buffer =                "",
  cmp_path =                  "",
  cmp_nvim_lsp =              "",
  cmp_nvim_ultisnips =        "",
  copilot_vim =               "",
  rust_tools_nvim =           "",
  vim_jdaddy =                "",
  csv_vim =                   "",
  vimtex =                    "",
  tex_conceal_vim =           "",
  vim_angry_reviewer =        "",
  vim_tex_kawaii =            "",
  MatchTagAlways =            "",
  emmet_vim =                 "",
  vim_closetag =              "",
  vim_solidity =              "",
  colorizer =                 "",
  nvim_treesitter =           "",
  playground =                "",
  telescope_nvim =            "",
  telescope_fzy_native_nvim = "",
  plenary_nvim =              "",
  UltiSnips =                 "",
  vim_snippets =              "",
  latex_snippets =            "",
  nvim_tree_lua =             "",
  tagbar =                    "",
  nvim_web_devicons =         "",
  dashboard_nvim =            "",
  symbols_outline_nvim =      "",
  TrueZen_nvim =              "",
  nightfox_nvim =             "",
  NeoSolarized =              "",
  lualine_nvim =              "",
  bufferline_nvim =           "",
  vim_gitgutter =             "",
  vim_rhubarb =               "",
  vim_fugitive =              "",
  nerdcommenter =             "",
  nvim_autopairs =            "",
  markdown_preview_nvim =     "",
  which_key_nvim =            "",
  vim_translator =            "",
  vim_table_mode =            "",
  vim_easymotion =            "",
  nvim_minimap =              "",
  vim_illuminate =            "",
  indent_blankline_nvim =     "",
  neoscroll_nvim =            "",
  vim_surround =              "",
  twilight_nvim =             "",
  limelight_vim =             "",
  toggleterm_nvim =           "",
  shade_nvim =                "",
}

return require('packer').startup({
  function()
    --------------------
    -- Plugin Manager --
    --------------------

    use {
      'wbthomason/packer.nvim',
      commit=commit.packer,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }

    ---------------
    -- LSP Stuff --
    ---------------

    use {
      'neovim/nvim-lspconfig',
      commit=commit.nvim_lspconfig,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
     'onsails/lspkind-nvim',
      commit=commit.lspkind_nvim,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'tami5/lspsaga.nvim',
      commit=commit.lspsaga_nvim,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'williamboman/nvim-lsp-installer',
      commit=commit.nvim_lsp_installer,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }

    ----------------
    -- Completion --
    ----------------

    use {
      'hrsh7th/nvim-cmp',
      commit=commit.nvim_cmp,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'hrsh7th/cmp-cmdline',
      commit=commit.cmp_cmdline,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'hrsh7th/cmp-buffer',
      commit=commit.cmp_buffer,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'hrsh7th/cmp-path',
      commit=commit.cmp_path,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'hrsh7th/cmp-nvim-lsp',
      commit=commit.cmp_nvim_lsp,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'quangnguyen30192/cmp-nvim-ultisnips',
      commit=commit.cmp_nvim_ultisnips,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'github/copilot.vim',
      commit=commit.copilot_vim,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }

    -----------------------------
    -- Language specific tools --
    -----------------------------

    use {
      'simrat39/rust-tools.nvim',
      commit=commit.rust_tools_nvim,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'tpope/vim-jdaddy',
      commit=commit.vim_jdaddy,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'chrisbra/csv.vim',
      commit=commit.csv_vim,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'lervag/vimtex',
      commit=commit.vimtex,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'KeitaNakamura/tex-conceal.vim',
      commit=commit.tex_conceal_vim,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'anufrievroman/vim-angry-reviewer',
      commit=commit.vim_angry_reviewer,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'anufrievroman/vim-tex-kawaii',
      commit=commit.vim_tex_kawaii,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'Valloric/MatchTagAlways',
      commit=commit.MatchTagAlways,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'mattn/emmet-vim',
      commit=commit.emmet_vim,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'alvan/vim-closetag',
      commit=commit.vim_closetag,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }

    ------------
    -- Colors --
    ------------

    use {
      'tomlion/vim-solidity',
      commit=commit.vim_solidity,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'lilydjwg/colorizer',
      commit=commit.colorizer,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'nvim-treesitter/nvim-treesitter',
      commit=commit.nvim_treesitter,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'nvim-treesitter/playground',
      commit=commit.playground,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }

    ---------------
    -- Telescope --
    ---------------

    use {
      'nvim-telescope/telescope.nvim',
      commit=commit.telescope_nvim,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'nvim-telescope/telescope-fzy-native.nvim',
      commit=commit.telescope_fzy_native_nvim,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'nvim-lua/plenary.nvim',
      commit=commit.plenary_nvim,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }

    --------------
    -- Snippets --
    --------------

    use {
      'SirVer/UltiSnips',
      commit=commit.UltiSnips,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'honza/vim-snippets',
      commit=commit.vim_snippets,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'gillescastel/latex-snippets',
      commit=commit.latex_snippets,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }

    -------------------------
    -- NvimTree and Tagbar --
    -------------------------

    use {
      'kyazdani42/nvim-tree.lua',
      commit=commit.nvim_tree_lua,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'preservim/tagbar',
      commit=commit.tagbar,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'kyazdani42/nvim-web-devicons',
      commit=commit.nvim_web_devicons,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'glepnir/dashboard-nvim',
      commit=commit.dashboard_nvim,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'simrat39/symbols-outline.nvim',
      commit=commit.symbols_outline_nvim,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'Pocco81/TrueZen.nvim',
      commit=commit.TrueZen_nvim,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }

    ------------------
    -- Colorschemes --
    ------------------

    use {
      'EdenEast/nightfox.nvim',
      commit=commit.nightfox_nvim,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'overcache/NeoSolarized',
      commit=commit.NeoSolarized,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }

    -----------------
    -- Status Line --
    -----------------

    use {
      'nvim-lualine/lualine.nvim',
      commit=commit.lualine_nvim
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'akinsho/bufferline.nvim',
      commit=commit.bufferline_nvim
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }

    ---------
    -- Git --
    ---------

    use {
      'airblade/vim-gitgutter',
      commit=commit.vim_gitgutter,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'tpope/vim-rhubarb',
      commit=commit.vim_rhubarb,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'tpope/vim-fugitive',
      commit=commit.vim_fugitive,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }

    -----------
    -- Other --
    -----------

    use {
      'scrooloose/nerdcommenter',
      commit=commit.nerdcommenter,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'windwp/nvim-autopairs',
      commit=commit.nvim_autopairs,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'iamcco/markdown-preview.nvim',
      commit=commit.markdown_preview_nvim,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'folke/which-key.nvim',
      commit=commit.which_key_nvim,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'voldikss/vim-translator',
      commit=commit.vim_translator,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'dhruvasagar/vim-table-mode',
      commit=commit.vim_table_mode,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'easymotion/vim-easymotion',
      --commit=commit.vim_easymotion,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'rinx/nvim-minimap',
      commit=commit.nvim_minimap,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'RRethy/vim-illuminate',
      commit=commit.vim_illuminate,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'lukas-reineke/indent-blankline.nvim',
      commit=commit.indent_blankline_nvim,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'karb94/neoscroll.nvim',
      commit=commit.neoscroll_nvim,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'tpope/vim-surround',
      commit=commit.vim_surround,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'folke/twilight.nvim',
      commit=commit.twilight_nvim,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'junegunn/limelight.vim',
      commit=commit.limelight_vim,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'akinsho/toggleterm.nvim',
      commit=commit.toggleterm_nvim,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
    use {
      'sunjon/shade.nvim',
      commit=commit.shade_nvim,
      branch=branch.packer,
      config=config.packer,
      disable=disable.packer
    }
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'rounded' })
      end
    }
  }
})

