local init_path = debug.getinfo(1, "S").source:sub(2)
local base_dir = init_path:match("(.*[/\\])"):sub(1, -2)

if not vim.tbl_contains(vim.opt.rtp:get(), base_dir) then
  vim.opt.rtp:append(base_dir)
end

require("dvim.bootstrap"):init(base_dir)

if #vim.api.nvim_list_uis() == 0 then
  return
end

Log = require("dvim.log")

dvim.statusline = require("dvim.statusline")
dvim.statusline.set()

local settings = require("dvim.settings")
settings.load_defaults()
Log.trace("Loaded settings")

require("dvim.autocmds")
Log.trace("Loaded autocmds")

require("dvim.augroup")
Log.trace("Loaded augroups")

local colorscheme = require("dvim.colorscheme")
colorscheme.apply_colorscheme(dvim.color.name)
colorscheme.highlight_lsp()
colorscheme.edit_colors()
Log.trace("Applied colorscheme")

local actions = require("dvim.core.actions")
actions.load_actions()
Log.trace("Loaded actions")

local filetypes = require("dvim.core.filetypes")
filetypes.load_default_filetype_settings()
Log.trace("Loaded default filetype specific settings")
filetypes.load_user_filetype_settings()
Log.trace("Loaded user filetype specific settings")

if dvim.lsp.active then
  local lsp = require("dvim.lsp")
  lsp.setup()
  Log.trace("Loaded LSP")
end
