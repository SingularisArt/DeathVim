local core_plugins = {
  { "wbthomason/packer.nvim" },

  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "antoinemadec/FixCursorHold.nvim" },
  { "lewis6991/impatient.nvim" },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("dvim.core.notify").setup()
    end,
  },

  -- Colorschemes
  { "EdenEast/nightfox.nvim" },
  { "lunarvim/colorschemes" },
  { "lunarvim/darkplus.nvim" },
  { "dylanaraps/wal.vim" },
  { "lilydjwg/colorizer" },
  { "tjdevries/colorbuddy.nvim" },
  { "tomasiser/vim-code-dark" },

  -- LSP
  { "neovim/nvim-lspconfig" },
  { "williamboman/nvim-lsp-installer" },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "onsails/lspkind-nvim" },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("dvim.core.symbols-outline").setup()
    end,
    disable = not dvim.builtin.symbols_outline.active,
  },
  { "ray-x/navigator.lua" },
  { "ray-x/guihua.lua" },
  { "ray-x/lsp_signature.nvim" },
  { "rmagatti/goto-preview" },
  { "tamago324/nlsp-settings.nvim" },

  -- WhichKey
  {
    -- NOTE: Temporary fix till folke comes back
    "max397574/lua-dev.nvim",
    module = "lua-dev",
  },
  {
    "max397574/which-key.nvim",
    commit = "f03a259",
    config = function()
      require("dvim.core.which-key").setup()
    end,
    disable = not dvim.builtin.which_key.active,
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("dvim.core.gitsigns").setup()
    end,
    event = "BufRead",
    disable = not dvim.builtin.gitsigns.active,
  },
  { "tpope/vim-rhubarb" },
  { "tpope/vim-fugitive" },

  -- Comments
  {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
      require("dvim.core.comment").setup()
    end,
    disable = not dvim.builtin.comment.active,
  },

  -- Other
  { "mattn/emmet-vim" },
  { "Valloric/MatchTagAlways" },
  { "alvan/vim-closetag" },
  { "wakatime/vim-wakatime" },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufReadPost",
  },
  { "easymotion/vim-easymotion" },
  {
    "Mephistophiles/surround.nvim",
    config = function()
      require("dvim.core.surround").setup()
    end,
    disable = not dvim.builtin.surround.active,
  },
  { "voldikss/vim-translator" },
  { "dhruvasagar/vim-table-mode" },
  { "machakann/vim-highlightedyank" },
  { "turbio/bracey.vim" },
  {
    "folke/todo-comments.nvim",
    config = function()
      require("dvim.core.todo-comments").setup()
    end,
    disable = not dvim.builtin.todo_comments.active,
  },
  {
    "matbme/JABS.nvim",
    config = function()
      require("dvim.core.jabs").setup()
    end,
    disable = not dvim.builtin.jabs.active,
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    event = "BufWinEnter",
    branch = "main",
    config = function()
      require("dvim.core.terminal").setup()
    end,
    disable = not dvim.builtin.terminal.active,
  },

  { "kyazdani42/nvim-web-devicons" }, -- Icons

  -- TreeSitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  },
  { "nvim-treesitter/playground" },

  -- GPS
  {
    "SmiteshP/nvim-gps",
    config = function()
      require("dvim.core.gps").setup()
    end,
  },

  -- Winbar
  -- {
  --   "fgheng/winbar.nvim",
  --   config = function()
  --     require("dvim.core.winbar").setup()
  --   end,
  --   disable = not dvim.builtin.winbar.active,
  -- },

  -- Debugging
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("dvim.core.dap").setup()
    end,
    disable = not dvim.builtin.dap.active,
  },
  {
    "rcarriga/nvim-dap-ui",
    disable = not dvim.builtin.dap.active,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    disable = not dvim.builtin.dap.active,
  },
  {
    "ravenxrz/DAPInstall.nvim",
    disable = not dvim.builtin.dap.active,
  },
  {
    "mfussenegger/nvim-dap-python",
    disable = not dvim.builtin.dap.active,
  },

  -- Alpha
  {
    "goolord/alpha-nvim",
    config = function()
      require("dvim.core.alpha").setup()
    end,
    disable = not dvim.builtin.alpha.active,
  },

  -- Snippets
  {
    "SirVer/UltiSnips",
    config = function()
      require("dvim.core.ultisnips").setup()
    end,
    disable = not dvim.builtin.ultisnips.active,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("dvim.core.telescope").setup()
    end,
    disable = not dvim.builtin.telescope.active,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    run = "make",
    disable = not dvim.builtin.telescope.active,
  },

  -- Project
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("dvim.core.project").setup()
    end,
    disable = not dvim.builtin.project.active,
  },

  -- CMP
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("dvim.core.cmp").setup()
    end,
    disable = not dvim.builtin.cmp.active,
  },
  {
    "hrsh7th/cmp-buffer",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.cmp.active,
  },
  {
    "hrsh7th/cmp-path",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.cmp.active,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.cmp.active,
  },
  {
    "hrsh7th/cmp-nvim-lua",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.cmp.active,
  },
  {
    "hrsh7th/cmp-calc",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.cmp.active,
  },
  {
    "rcarriga/cmp-dap",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.cmp.active,
  },
  {
    "tzachar/cmp-tabnine", run = "./install.sh",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.cmp.active,
  },
  {
    "quangnguyen30192/cmp-nvim-ultisnips",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.cmp.active,
  },
  {
    "kdheepak/cmp-latex-symbols",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.cmp.active,
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("dvim.core.autopairs").setup()
    end,
    disable = not dvim.builtin.autopairs.active,
  },

  -- NvimTree
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("dvim.core.nvimtree").setup()
    end,
    disable = not dvim.builtin.nvimtree.active,
  },

  -- Status Line and Bufferline
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("dvim.core.lualine").setup()
    end,
    disable = not dvim.builtin.lualine.active,
  },
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("dvim.core.bufferline").setup()
    end,
    branch = "main",
    event = "BufWinEnter",
    disable = not dvim.builtin.bufferline.active,
  },

  -- LaTeX
  {
    "lervag/vimtex",
    config = function()
      require("dvim.core.vimtex").setup()
    end,
    disable = not dvim.builtin.vimtex.active,
  },
  {
    "KeitaNakamura/tex-conceal.vim",
    disable = not dvim.builtin.vimtex.active,
  },

  -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    config = function()
      require("dvim.core.markdown").setup()
    end,
    disable = not dvim.builtin.markdown.active,
  },

  -- SchemaStore
  {
    "b0o/schemastore.nvim",
  },
}

for _, entry in ipairs(core_plugins) do
  if os.getenv("DVIM_DEV_MODE") then
    entry["lock"] = true
  end
end

return core_plugins
