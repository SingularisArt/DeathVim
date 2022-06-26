local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

return require('packer').startup(function(use)
  use { "wbthomason/packer.nvim" }

  use { "RRethy/vim-illuminate", event = "VimEnter" }
  use { "folke/lua-dev.nvim", event = "VimEnter" }

  use { "nvim-lua/popup.nvim" }
  use { "nvim-lua/plenary.nvim" }
  use { "antoinemadec/FixCursorHold.nvim" }
  use { "lewis6991/impatient.nvim" }
  use {
    "rcarriga/nvim-notify",
    config = function()
      require("dvim.core.plugins.notify").setup()
    end,
  }

  -- Colorschemes
  use { "lilydjwg/colorizer" }
  use { "nekonako/xresources-nvim" }
  use { "EdenEast/nightfox.nvim" }
  use { "lunarvim/colorschemes" }
  use { "dylanaraps/wal.vim" }
  use { "tomasiser/vim-code-dark" }
  use { "AlphaTechnolog/pywal.nvim" }
  use { "lighthaus-theme/vim-lighthaus" }
  use { "jacoborus/tender.vim" }
  use { "mcchrish/zenbones.nvim" }
  use { "rmehri01/onenord.nvim" }
  use { "Shatur/neovim-ayu" }
  use { "rafamadriz/neon" }
  use { "luisiacc/gruvbox-baby" }
  use { "folke/tokyonight.nvim" }
  use { "chriskempson/base16-vim" }
  use { "flazz/vim-colorschemes" }

  -- Indent Blankline
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("dvim.core.plugins.indent-blankline").setup()
    end,
    disable = not dvim.builtin.plugins.indent_blankline.active,
  }

  -- LSP
  use { "neovim/nvim-lspconfig" }
  use { "williamboman/nvim-lsp-installer" }
  use { "jose-elias-alvarez/null-ls.nvim" }
  use { "onsails/lspkind-nvim" }
  use {
    "b0o/SchemaStore.nvim",
    disable = not dvim.builtin.filetypes.json.active,
  }
  use {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("dvim.core.plugins.symbols-outline").setup()
    end,
    disable = not dvim.builtin.plugins.symbols_outline.active,
  }
  use { "ray-x/navigator.lua" }
  use { "ray-x/guihua.lua" }
  use { "ray-x/lsp_signature.nvim" }
  use { "rmagatti/goto-preview" }
  use { "tamago324/nlsp-settings.nvim" }

  -- Log files
  use {
    "mtdl9/vim-log-highlighting",
    disable = not dvim.builtin.filetypes.log.active,
  }

  -- WhichKey
  use {
    "max397574/which-key.nvim",
    commit = "f03a259",
    config = function()
      require("dvim.core.plugins.which-key").setup()
    end,
    disable = not dvim.builtin.plugins.which_key.active,
  }

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("dvim.core.plugins.gitsigns").setup()
    end,
    event = "BufRead",
    disable = not dvim.builtin.plugins.gitsigns.active,
  }
  use { "tpope/vim-rhubarb" }
  use { "tpope/vim-fugitive" }

  -- Comments
  use {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
      require("dvim.core.plugins.comment").setup()
    end,
    disable = not dvim.builtin.plugins.comment.active,
  }

  -- Other
  use { "mattn/emmet-vim" }
  use { "Valloric/MatchTagAlways" }
  use { "alvan/vim-closetag" }
  use { "wakatime/vim-wakatime" }
  use { "easymotion/vim-easymotion" }
  use { "voldikss/vim-translator" }
  use { "dhruvasagar/vim-table-mode" }
  use { "machakann/vim-highlightedyank" }
  use { "turbio/bracey.vim" }
  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufReadPost",
  }

  -- Surround
  use {
    "Mephistophiles/surround.nvim",
    config = function()
      require("dvim.core.plugins.surround").setup()
    end,
    disable = not dvim.builtin.plugins.surround.active,
  }

  -- Todo Comments
  use {
    "folke/todo-comments.nvim",
    config = function()
      require("dvim.core.plugins.todo-comments").setup()
    end,
    disable = not dvim.builtin.plugins.todo_comments.active,
  }

  -- Jabs
  use {
    "matbme/JABS.nvim",
    config = function()
      require("dvim.core.plugins.jabs").setup()
    end,
    disable = not dvim.builtin.plugins.jabs.active,
  }

  -- Terminal
  use {
    "akinsho/toggleterm.nvim",
    event = "BufWinEnter",
    branch = "main",
    config = function()
      require("dvim.core.plugins.terminal").setup()
    end,
    disable = not dvim.builtin.plugins.terminal.active,
  }

  use { "kyazdani42/nvim-web-devicons" } -- Icons

  -- TreeSitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("dvim.core.plugins.treesitter").setup()
    end,
  }
  use { "nvim-treesitter/playground" }
  use {
    "lewis6991/spellsitter.nvim",
    config = function()
      require("spellsitter").setup()
    end,
  }

  -- GPS
  use {
    "SmiteshP/nvim-gps",
    config = function()
      require("dvim.core.plugins.gps").setup()
    end,
  }

  -- Winbar
  -- use {
  --   "fgheng/winbar.nvim",
  --   config = function()
  --     require("dvim.core.plugins.winbar").setup()
  --   end,
  --   disable = not dvim.builtin.plugins.winbar.active,
  -- }

  -- Debugging
  use {
    "mfussenegger/nvim-dap",
    config = function()
      require("dvim.core.plugins.dap").setup()
    end,
    disable = not dvim.builtin.plugins.dap.active,
  }
  use {
    "rcarriga/nvim-dap-ui",
    disable = not dvim.builtin.plugins.dap.active,
  }
  use {
    "theHamsta/nvim-dap-virtual-text",
    disable = not dvim.builtin.plugins.dap.active,
  }
  use {
    "ravenxrz/DAPInstall.nvim",
    disable = not dvim.builtin.plugins.dap.active,
  }
  use {
    "mfussenegger/nvim-dap-python",
    disable = not dvim.builtin.plugins.dap.active,
  }

  -- Alpha
  use {
    "goolord/alpha-nvim",
    config = function()
      require("dvim.core.plugins.alpha").setup()
    end,
    disable = not dvim.builtin.plugins.alpha.active,
  }

  -- Snippets
  use {
    "SirVer/UltiSnips",
    config = function()
      require("dvim.core.plugins.ultisnips").setup()
    end,
    disable = not dvim.builtin.plugins.ultisnips.active,
  }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("dvim.core.plugins.telescope").setup()
    end,
    disable = not dvim.builtin.plugins.telescope.active,
  }
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    run = "make",
    disable = not dvim.builtin.plugins.telescope.active,
  }

  -- Project
  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("dvim.core.plugins.project").setup()
    end,
    disable = not dvim.builtin.plugins.project.active,
  }

  -- Copilot
  use {
    "github/copilot.vim",
    disable = not dvim.builtin.plugins.copilot.active,
  }
  use {
    "hrsh7th/cmp-copilot",
    disable = not dvim.builtin.plugins.copilot.active and not dvim.builtin.plugins.cmp.active,
  }

  -- CMP
  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require("dvim.core.plugins.cmp").setup()
    end,
    disable = not dvim.builtin.plugins.cmp.active,
  }
  use {
    "hrsh7th/cmp-buffer",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  }
  use {
    "hrsh7th/cmp-path",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  }
  use {
    "hrsh7th/cmp-nvim-lsp",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  }
  use {
    "hrsh7th/cmp-nvim-lua",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  }
  use {
    "hrsh7th/cmp-calc",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  }
  use {
    "rcarriga/cmp-dap",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  }
  use {
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  }
  use {
    "quangnguyen30192/cmp-nvim-ultisnips",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  }
  use {
    "kdheepak/cmp-latex-symbols",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active and not dvim.builtin.filetypes.latex.active,
  }
  use {
    "hrsh7th/cmp-emoji",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  }

  -- Autopairs
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("dvim.core.plugins.autopairs").setup()
    end,
    disable = not dvim.builtin.plugins.autopairs.active,
  }

  -- NvimTree
  use {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("dvim.core.plugins.nvimtree").setup()
    end,
    disable = not dvim.builtin.plugins.nvimtree.active,
  }

  -- Status Line and Bufferline
  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("dvim.core.plugins.lualine").setup()
    end,
    disable = not dvim.builtin.plugins.lualine.active,
  }
  use {
    "akinsho/bufferline.nvim",
    config = function()
      require("dvim.core.plugins.bufferline").setup()
    end,
    branch = "main",
    disable = not dvim.builtin.plugins.bufferline.active,
  }

  -- LaTeX
  use {
    "lervag/vimtex",
    config = function()
      require("dvim.core.plugins.vimtex").setup()
    end,
    disable = not dvim.builtin.filetypes.latex.active,
  }
  use {
    "KeitaNakamura/tex-conceal.vim",
    disable = not dvim.builtin.filetypes.latex.active,
  }

  -- Markdown
  use {
    "iamcco/markdown-preview.nvim",
    config = function()
      require("dvim.core.plugins.markdown").setup()
    end,
    disable = not dvim.builtin.filetypes.markdown.active,
  }
end)
