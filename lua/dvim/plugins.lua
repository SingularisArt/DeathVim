local fn = vim.fn

local pack_dir = join_paths(get_runtime_dir(), "site", "pack")
local packer_install_dir = join_paths(pack_dir, "packer", "start", "packer.nvim")
local compile_path = join_paths(get_config_dir(), "plugin", "packer_compiled.lua")

-- Automatically install packer
if fn.empty(fn.glob(packer_install_dir)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    packer_install_dir,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local packer = require_clean("packer")

-- Have packer use a popup window
packer.init({
  package_root = pack_dir,
  compile_path = compile_path,
  log = { level = "warn" },
  git = {
    clone_timeout = 300,
  },
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  for _, plugin in pairs(dvim.plugins) do
    use({ plugin })
  end

  use({ "wbthomason/packer.nvim" })

  use({ "nvim-lua/popup.nvim" })
  use({ "nvim-lua/plenary.nvim" })
  use({
    "rcarriga/nvim-notify",
    config = function()
      require("dvim.core.plugins.notify").setup()
    end,
  })

  -- Color Pickers
  use({
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("dvim.core.plugins.colorizer").setup()
    end,
    disable = not dvim.builtin.plugins.colors.active,
  })
  use({
    "mrshmllow/document-color.nvim",
    config = function()
      require("dvim.core.plugins.document-color").setup()
    end,
    disable = not dvim.builtin.plugins.colors.active,
  })

  -- Colorschemes
  use({ "folke/tokyonight.nvim" })
  use({ "chriskempson/base16-vim" })
  use({ "flazz/vim-colorschemes" })
  use({ "wincent/pinnacle" })

  -- Indent Blankline
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("dvim.core.plugins.indent-blankline").setup()
    end,
    disable = not dvim.builtin.plugins.indent_blankline.active,
  })

  -- LSP
  use({
    "neovim/nvim-lspconfig",
    disable = not dvim.lsp.active,
  })
  use({
    "jose-elias-alvarez/null-ls.nvim",
    disable = not dvim.lsp.active,
  })
  use({
    "onsails/lspkind-nvim",
    disable = not dvim.lsp.active,
  })
  use({
    "folke/lua-dev.nvim",
    disable = not dvim.lsp.active,
  })
  use({
    "RRethy/vim-illuminate",
    config = function()
      require("dvim.core.plugins.illuminate").setup()
    end,
    disable = not dvim.lsp.active,
  })
  use({
    "simrat39/symbols-outline.nvim",
    config = function()
      require("dvim.core.plugins.symbols-outline").setup()
    end,
    disable = not dvim.lsp.active and not dvim.builtin.plugins.symbols_outline.active,
  })
  use({
    "ray-x/lsp_signature.nvim",
    disable = not dvim.lsp.active,
  })
  use({
    "tamago324/nlsp-settings.nvim",
    disable = not dvim.lsp.active,
  })
  use({
    "williamboman/mason.nvim",
    disable = not dvim.lsp.active,
  })
  use({
    "williamboman/mason-lspconfig.nvim",
    disable = not dvim.lsp.active,
  })
  use({
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    disable = not dvim.lsp.active,
  })
  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("dvim.lsp.lines").setup()
    end,
    disable = not dvim.lsp.active and not dvim.lsp.lsp_lines,
  })

  -- WhichKey
  use({
    "max397574/which-key.nvim",
    config = function()
      require("dvim.core.plugins.which-key").setup()
    end,
    event = "BufWinEnter",
    disable = not dvim.builtin.plugins.which_key.active,
  })

  -- Auto docstring generator
  use({
    "danymat/neogen",
    config = function()
      require("dvim.core.plugins.neogen").setup()
    end,
    disable = not dvim.builtin.plugins.neogen.active,
  })

  -- Git
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("dvim.core.plugins.gitsigns").setup()
    end,
    disable = not dvim.builtin.plugins.gitsigns.active,
  })
  use({ "tpope/vim-rhubarb" })
  use({ "tpope/vim-fugitive" })

  -- Comments
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("dvim.core.plugins.comment").setup()
    end,
    disable = not dvim.builtin.plugins.comment.active,
  })

  -- Other
  use({ "mattn/emmet-vim" })
  use({ "Valloric/MatchTagAlways" })
  use({ "wakatime/vim-wakatime" })
  use({ "voldikss/vim-translator" })
  use({ "dhruvasagar/vim-table-mode" })
  use({ "machakann/vim-highlightedyank" })

  -- Icons
  use({ "kyazdani42/nvim-web-devicons" })

  -- TreeSitter
  use({
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("dvim.core.plugins.treesitter").setup()
    end,
  })
  use({ "nvim-treesitter/playground" })
  -- use({ "JoosepAlviste/nvim-ts-context-commentstring" })
  use({ "p00f/nvim-ts-rainbow" })
  -- use({ "nvim-treesitter/nvim-treesitter-textobjects" })
  -- use({ "wellle/targets.vim" })
  -- use({ "RRethy/nvim-treesitter-textsubjects" })

  -- Debugging
  use({
    "mfussenegger/nvim-dap",
    config = function()
      require("dvim.core.plugins.dap").setup()
    end,
    disable = not dvim.builtin.plugins.dap.active,
  })
  use({
    "rcarriga/nvim-dap-ui",
    disable = not dvim.builtin.plugins.dap.active,
  })
  use({
    "theHamsta/nvim-dap-virtual-text",
    disable = not dvim.builtin.plugins.dap.active,
  })
  use({
    "ravenxrz/DAPInstall.nvim",
    disable = not dvim.builtin.plugins.dap.active,
  })

  -- Snippets
  use({
    "SirVer/UltiSnips",
    config = function()
      require("dvim.core.plugins.ultisnips").setup()
    end,
    disable = not dvim.builtin.plugins.ultisnips.active,
  })

  -- Autopairs
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("dvim.core.plugins.autopairs").setup()
    end,
    disable = not dvim.builtin.plugins.autopairs.active,
  })

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    config = function()
      require("dvim.core.plugins.telescope").setup()
    end,
    disable = not dvim.builtin.plugins.telescope.active,
  })
  use({
    "ahmedkhalf/project.nvim",
    config = function()
      require("dvim.core.plugins.project").setup()
    end,
    disable = not dvim.builtin.plugins.telescope.active
        and not dvim.builtin.plugins.telescope.extensions.active
        and not dvim.builtin.plugins.telescope.extensions.project.active,
  })

  -- CMP
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      require("dvim.core.plugins.cmp").setup()
    end,
    disable = not dvim.builtin.plugins.cmp.active,
  })
  use({
    "hrsh7th/cmp-buffer",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active
        and not dvim.builtin.plugins.cmp.extensions.active
        and not dvim.builtin.plugins.cmp.extensions.buffer.active,
  })
  use({
    "hrsh7th/cmp-path",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active
        and not dvim.builtin.plugins.cmp.extensions.active
        and not dvim.builtin.plugins.cmp.extensions.path.active,
  })
  use({
    "hrsh7th/cmp-nvim-lsp",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active
        and not dvim.builtin.plugins.cmp.extensions.active
        and not dvim.builtin.plugins.cmp.extensions.nvim_lsp.active,
  })
  use({
    "hrsh7th/cmp-nvim-lua",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active
        and not dvim.builtin.plugins.cmp.extensions.active
        and not dvim.builtin.plugins.cmp.extensions.nvim_lua.active,
  })
  use({
    "hrsh7th/cmp-calc",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active
        and not dvim.builtin.plugins.cmp.extensions.active
        and not dvim.builtin.plugins.cmp.extensions.calc.active,
  })
  use({
    "rcarriga/cmp-dap",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active
        and not dvim.builtin.plugins.dap.active
        and not dvim.builtin.plugins.cmp.extensions.active
        and not dvim.builtin.plugins.cmp.extensions.dap.active,
  })
  use({
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active
        and not dvim.builtin.plugins.cmp.extensions.active
        and not dvim.builtin.plugins.cmp.extensions.cmp_tabnine.active,
  })
  use({
    "quangnguyen30192/cmp-nvim-ultisnips",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active
        and not dvim.builtin.plugins.cmp.extensions.active
        and not dvim.builtin.plugins.cmp.extensions.ultisnips.active,
  })
  use({
    "kdheepak/cmp-latex-symbols",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active
        and not dvim.builtin.filetypes.latex.active
        and not dvim.builtin.plugins.cmp.extensions.active
        and not dvim.builtin.plugins.cmp.extensions.latex_symbols.active,
  })
  use({
    "hrsh7th/cmp-emoji",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active
        and not dvim.builtin.plugins.cmp.extensions.active
        and not dvim.builtin.plugins.cmp.extensions.emoji.active,
  })

  -- File Browsers
  use({
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("dvim.core.plugins.file-browsers").setup()
    end,
    disable = not dvim.builtin.plugins.nvim_tree.active,
  })
  use({
    "preservim/nerdtree",
    config = function()
      require("dvim.core.plugins.file-browsers").setup()
    end,
    disable = not dvim.builtin.plugins.nerd_tree.active,
  })
  use({
    "justinmk/vim-dirvish",
    config = function()
      require("dvim.core.plugins.file-browsers").setup()
    end,
    disable = not dvim.builtin.plugins.dirvish.active,
  })

  -- LaTeX
  use({
    "lervag/vimtex",
    config = function()
      require("dvim.core.plugins.vimtex").setup()
    end,
    disable = not dvim.builtin.filetypes.latex.active,
  })
  use({
    "KeitaNakamura/tex-conceal.vim",
    disable = not dvim.builtin.filetypes.latex.active,
  })

  -- Markdown
  use({
    "iamcco/markdown-preview.nvim",
    config = function()
      require("dvim.core.plugins.markdown").setup()
    end,
    disable = not dvim.builtin.filetypes.markdown.active,
  })
  use({
    "mzlogin/vim-markdown-toc",
    disable = not dvim.builtin.filetypes.markdown.active,
  })
  use({
    "dkarter/bullets.vim",
    disable = not dvim.builtin.filetypes.markdown.active,
  })

  -- Tmux
  use({
    "christoomey/vim-tmux-navigator",
    config = function()
      require("dvim.core.plugins.tmux").setup()
    end,
    disable = not dvim.builtin.filetypes.tmux,
  })

  -- UndoTree
  use({ "mbbill/undotree" })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
