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

local plugins = require("dvim.plugins")
require("dvim.plugin-loader").load({ plugins, dvim.plugins })

Utils.safe_require("dvim.settings.options")
Utils.safe_require("dvim.settings.keymaps")
Utils.safe_require("dvim.settings.colorscheme")
Utils.safe_require("dvim.settings.autocommands")

M.user_lsp_config()
Utils.safe_require("dvim.lsp")
