local M = require('dvim.utils.functions')

local tree_sitter = M.safe_require('nvim-treesitter.configs')

tree_sitter.setup({
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
