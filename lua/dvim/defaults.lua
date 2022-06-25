local builtin_plugins = {
  "alpha",
  "indent_blankline",
  "symbols_outline",
  "which_key",
  "gitsigns",
  "comment",
  "surround",
  "todo_comments",
  "jabs",
  "terminal",
  "dap",
  "alpha",
  "ultisnips",
  "telescope",
  "project",
  "copilot",
  "cmp",
  "autopairs",
  "nvimtree",
  "lualine",
  "bufferline",
  "notify",
  "treesitter",
  "latex",
  "markdown",
}

local builtin_filetypes = {
  "python",
  "cpp",
  "cs",
  "c",
  "sql",
  "cmake",
  "yaml",
  "html",
  "bash",
  "css",
  "js",
  "ts",
  "php",
  "ruby",
  "perl",
  "java",
  "json",
  "rust",
  "latex",
  "markdown",
  "lua",
  "log",
  "vim",
}

dvim = {
  leader = " ",
  colorscheme = "onedarker",
  transparent_window = false,
  format_on_save = true,
  keys = {},
  language_servers = {},
  vim_commands = {},

  use_icons = true,

  builtin = {},

  plugins = {
    -- use config.lua for this not put here
  },

  autocommands = {},
  lang = {},
  log = {
    ---@usage can be { "trace", "debug", "info", "warn", "error", "fatal" },
    level = "trace",
  },
}

dvim.lsp = require('dvim.lsp.config')
dvim.builtin.plugins = {}
dvim.builtin.filetypes = {}

for _, plugin in ipairs(builtin_plugins) do
  dvim.builtin.plugins[plugin] = {}
end

for _, filetype in ipairs(builtin_filetypes) do
  dvim.builtin.filetypes[filetype] = {}
end

dvim.builtin.plugins.which_key.mappings = {}

dvim.builtin.plugins.treesitter.highlight = {}
dvim.builtin.plugins.treesitter.indent = {}

return dvim
