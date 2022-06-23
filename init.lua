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

Utils = require("dvim.utils.functions")
require("dvim.settings.defaults")

M = require("config")
require("dvim.bootstrap"):init(base_dir)

Utils.safe_require("dvim.keymappings").load_defaults()

local plugins = require("dvim.plugins")
require("dvim.plugin-loader").load({ plugins, dvim.plugins })

local settings = Utils.safe_require("dvim.settings")
settings.load_defaults()

local autocmds = Utils.safe_require("dvim.autocmds")
autocmds.load_defaults()

local colorscheme = require("dvim.colorscheme")
colorscheme.apply_colorscheme(dvim.colorscheme)

M.user_lsp_config()
dvim.lsp = Utils.safe_require("dvim.lsp.config")
require("dvim.lsp")
