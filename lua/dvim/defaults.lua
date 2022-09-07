dvim = {
  leader = " ",
  color = {
    name = "base16-bright",
    dark = true,
    light = false,
  },
  transparent_window = false,
  format_on_save = false,
  keys = {
    normal_mode = {},
    insert_mode = {},
    visual_mode = {},
  },
  language_servers = {},
  vim_commands = {},
  use_icons = true,
  autocommands = {},
  lang = {},
  lsp = require("dvim.lsp.config"),
  builtin = {
    actions = require("dvim.core.actions").get_defaults(),
    plugins = require("dvim.core.plugins").get_defaults(),
    filetypes = require("dvim.core.filetypes").get_defaults(),
  },
}

return dvim
