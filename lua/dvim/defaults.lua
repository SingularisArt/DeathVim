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
  "html",
  "css",
  "js",
  "ts",
  "php",
  "ruby",
  "perl",
  "java",
  "rust",
  "latex",
  "markdown",
  "lua",
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
    level = "warn",
    viewer = {
      ---@usage this will fallback on "less +F" if not found
      cmd = "lnav",
      layout_config = {
        ---@usage direction = 'vertical' | 'horizontal' | 'window' | 'float',
        direction = "horizontal",
        open_mapping = "",
        size = 40,
        float_opts = {},
      },
    },
    -- currently disabled due to instabilities
    override_notify = false,
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
