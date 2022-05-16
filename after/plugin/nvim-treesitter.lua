local nvim_treesitter = SingularisArt.call('nvim-treesitter.configs', 'Tree Sitter')

nvim_treesitter.setup({
  ensure_installed = "all",

  highlight = {
    disable = {
      "latex",
      "markdown",
    },
    additional_vim_regex_highlighting = true,
    enable = true,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

  indent = {
    enable = false,
  },
})

