vim.cmd [[
  set runtimepath+=~/.config/dvim
  set runtimepath+=~/.local/share/deathvim/dvim
  set runtimepath+=~/.local/share/deathvim/site
]]

local init_path = debug.getinfo(1, "S").source:sub(2)
local base_dir = init_path:match("(.*[/\\])"):sub(1, -2)

if not vim.tbl_contains(vim.opt.rtp:get(), base_dir) then
  vim.opt.rtp:append(base_dir)
end

require("dvim.global")
require("dvim.defaults")

require("config")
require("dvim.plugins")

if #vim.api.nvim_list_uis() == 0 then
  return
end

Utils = require("dvim.utils.functions")

Log = require("dvim.log")

Utils.safe_require("dvim.keymappings").load_defaults()

local settings = Utils.safe_require("dvim.settings")
settings.load_defaults()
Log.trace("Loaded settings")

local autocmds = Utils.safe_require("dvim.autocmds")
autocmds.load_defaults()
Log.trace("Loaded autocmds")

local parse_vim_commands = Utils.safe_require("dvim.parse_vim_commands")
parse_vim_commands.load_defaults()
Log.trace("Loaded vim commands")

local colorscheme = require("dvim.colorscheme")
colorscheme.apply_colorscheme(dvim.colorscheme)
Log.trace("Applied colorscheme")

require("dvim.lsp")
Log.trace("Loaded LSP")
