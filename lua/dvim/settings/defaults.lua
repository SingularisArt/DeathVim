local builtin_plugins = {
  "alpha",
  "symbols_outline",
  "todo_comments",
  "surround",
  "terminal",
  "comment",
  "jabs",
  "comments",
  "gitsigns",
  "autopairs",
  "bufferline",
  "cmp",
  "dap",
  "lualine",
  "markdown",
  "nvimtree",
  "telescope",
  "project",
  "ultisnips",
  "vimtex",
  "which_key",
  "winbar",
  "notify",
}

dvim = {
  leader = " ",
  colorscheme = "onedarker",
  transparent_window = false,
  format_on_save = true,
  keys = {},
  language_servers = {},

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

for _, plugin in ipairs(builtin_plugins) do
  dvim.builtin[plugin] = {}
end

dvim.builtin.which_key.mappings = {}

return dvim
