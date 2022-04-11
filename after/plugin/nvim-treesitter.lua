local tree_sitter_status, nvim_treesitter = pcall(require, "nvim-treesitter.configs")

if not tree_sitter_status then
	vim.notify("Please Install 'nvim-treesitter'")
	return
end

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

