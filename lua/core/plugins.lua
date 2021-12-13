local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup({
  function()
    -- Plugin Manager
    use { 'wbthomason/packer.nvim' } -- Packer is smart enough to manage itself

    -- LSP Stuff
    use { 'neovim/nvim-lspconfig' } -- Main lsp plugin
    use { 'tamago324/nlsp-settings.nvim' } -- Some default lsp settings
    use { 'williamboman/nvim-lsp-installer' } -- Installs lsp servers
    use { 'onsails/lspkind-nvim' } -- Gives us icons
    use { 'tami5/lspsaga.nvim', branch="nvim51" }
    use { 'ray-x/lsp_signature.nvim' } -- Shows function signatures
    use { 'mfussenegger/nvim-dap' } -- Debug
    use { 'folke/trouble.nvim' } -- Shows all errors/warnings/infos/hints

    -- Completion
    use { 'hrsh7th/nvim-cmp' } -- Autocomplete engine
    use { 'hrsh7th/cmp-cmdline' } -- Autocompletes when in command mode
    use { 'hrsh7th/cmp-buffer' } -- Autocompletes other words in other buffers
    use { 'hrsh7th/cmp-path' } -- Autocompletes path
    use { 'hrsh7th/cmp-nvim-lsp' } -- Autocompletes for lsp
    use { 'quangnguyen30192/cmp-nvim-ultisnips' } -- Autocompletes when in command mode

    -- Language specific tools
    use { 'simrat39/rust-tools.nvim' } -- For Rust
    use { 'tpope/vim-jdaddy' } -- For Json
    use { 'chrisbra/csv.vim' } -- For CSV
    use { 'lervag/vimtex' } -- For latex (You can compile, run, view, debug, etc)
    use { 'KeitaNakamura/tex-conceal.vim' } -- For latex (Shows math)
    use { 'anufrievroman/vim-angry-reviewer' } -- For latex (Reviews your code)
    use { 'anufrievroman/vim-tex-kawaii' } -- For latex (Gives you headers)
    use { 'Valloric/MatchTagAlways' } -- HTML Stuff (Highlights other tag)
    use { 'mattn/emmet-vim' } -- HTML Stuff (Quick writing)

    -- Colors
    use { 'numirias/semshi' } -- Better syntax highlighting for python
    use { 'bfrg/vim-cpp-modern' } -- Better syntax highlighting for C++ and C
    use { 'billyvg/tigris.nvim' } -- Better syntax highlighting for JS and TS
    use { 'lilydjwg/colorizer' } -- Shows hex, rgb, and other colors
    use { 'nvim-treesitter/nvim-treesitter' } -- Highlights special words
    use { 'nvim-treesitter/playground' } -- Highlights special words

    -- Telescope
    use { 'nvim-telescope/telescope.nvim' } -- Main plugin
    use { 'nvim-telescope/telescope-fzy-native.nvim' } -- Allows for fzf kinda feeling
    use { 'nvim-lua/plenary.nvim' } -- Needed for Telescope

    -- Snippets
    use { 'SirVer/UltiSnips' } -- Snippet engine
    use { 'honza/vim-snippets' } -- Some snippets
    use { 'gillescastel/latex-snippets' } -- LaTeX snippets
    
    -- NvimTree and Tagbar
    use { 'kyazdani42/nvim-tree.lua' } -- See outline of directory
    use { 'preservim/tagbar' } -- See outline of file
    use { 'kyazdani42/nvim-web-devicons' } -- Icons for NvimTree
    use { 'glepnir/dashboard-nvim' } -- Cool startup
    use { 'simrat39/symbols-outline.nvim' } -- Shows an outline with symbols
    use { 'Pocco81/TrueZen.nvim' } -- Distraction free

    -- Colorschemes
    use { 'EdenEast/nightfox.nvim' } -- Best colorscheme
    use { 'overcache/NeoSolarized' } -- Best theme

    -- Status Line
    use { 'nvim-lualine/lualine.nvim' } -- Best Status Line
    use { 'akinsho/bufferline.nvim' } -- Best Buffer Line

    -- Git
    use { 'airblade/vim-gitgutter' } -- Git signs
    use { 'tpope/vim-rhubarb' } -- Git commands
    use { 'tpope/vim-fugitive' } -- Git commands

    -- Other
    use { 'scrooloose/nerdcommenter' } -- Commenting
    use { 'windwp/nvim-autopairs' } -- Auto pairs
    use { 'iamcco/markdown-preview.nvim'} -- Markdown preview
    use { 'folke/which-key.nvim' } -- Whichkey
    use { 'voldikss/vim-translator' } -- Translator
    use { 'dhruvasagar/vim-table-mode' } -- Easy tables
    use { 'easymotion/vim-easymotion' } -- Quick navigation
    use { 'rinx/nvim-minimap' } -- Minimap
    use { 'RRethy/vim-illuminate' } -- Highlight other words
    use { 'lukas-reineke/indent-blankline.nvim' } -- Shows indentation
    use { 'karb94/neoscroll.nvim' } -- Nicer scrolling
    use { 'tpope/vim-surround' } -- Easier to surround items with (), {}, [], <>, '', "", ``
    use { 'blueyed/vim-diminactive' } -- Dims the inactive panes
    use { 'folke/twilight.nvim' } -- Turns off syntax
    use { 'junegunn/limelight.vim' } -- Turns off syntax
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
})

