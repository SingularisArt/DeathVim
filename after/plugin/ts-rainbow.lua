local ts_rainbow = SingularisArt.call('nvim-treesitter.configs', 'Tree Sitter')

ts_rainbow.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  }
}

