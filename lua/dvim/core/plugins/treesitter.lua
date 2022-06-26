local M = {}

M.config = function()
  dvim.builtin.plugins.treesitter.setup = {
    -- Directory to store TreeSitter parsers
    parser_install_dir = get_cache_dir() .. "treesitter",

    -- A list of parser names
    ensure_installed = {},

    -- List of parsers to ignore installing (for "all")
    ignore_install = {},

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,

    -- Autoindent
    indent = {
      enable = true,
    },

    autotag = {
      enable = true,
    },

    highlight = {
      -- Enable syntax highlighting
      enable = true,

      -- List of parsers to ignore
      disable = {},

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = true,
    },
  }
end

M.setup = function()
  M.config()
  vim.opt.runtimepath:append(get_cache_dir() .. "treesitter")

  local tree_sitter = require_clean("nvim-treesitter.configs")
  tree_sitter.setup(dvim.builtin.plugins.treesitter.setup)
end

M.setup()
return M
