local init_path = debug.getinfo(1, "S").source:sub(2)
local base_dir = init_path:match("(.*[/\\])"):sub(1, -2)

if not vim.tbl_contains(vim.opt.rtp:get(), base_dir) then
  vim.opt.rtp:append(base_dir)
end

require("dvim.bootstrap"):init(base_dir)

if #vim.api.nvim_list_uis() == 0 then
  return
end

dvim.statusline = require("dvim.statusline")
dvim.statusline.set()

local settings = require("dvim.settings")
settings.load_defaults()

require("dvim.autocmds")
require("dvim.augroup")

local colorscheme = require("dvim.colorscheme")
colorscheme.apply_colorscheme(dvim.color.name)
colorscheme.highlight_lsp()
colorscheme.edit_colors()

local actions = require("dvim.core.actions")
actions.load_actions()

local filetypes = require("dvim.core.filetypes")
filetypes.load_default_filetype_settings()
filetypes.load_user_filetype_settings()

if dvim.lsp.active then
  local lsp = require("dvim.lsp")
  lsp.setup()
end

local keys = require("dvim.keymappings")

dvim.keys.normal_mode["<C-h>"] = ":TSBufDisable highlight | TmuxNavigateLeft<CR>:TSBufEnable highlight<CR>"
dvim.keys.normal_mode["<C-j>"] = ":TSBufDisable highlight | TmuxNavigateDown<CR>:TSBufEnable highlight<CR>"
dvim.keys.normal_mode["<C-k>"] = ":TSBufDisable highlight | TmuxNavigateUp<CR>:TSBufEnable highlight<CR>"
dvim.keys.normal_mode["<C-l>"] = ":TSBufDisable highlight | TmuxNavigateRight<CR>:TSBufEnable highlight<CR>"

keys.load(dvim.keys)
