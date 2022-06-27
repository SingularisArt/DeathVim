local M = {}

if vim.fn.has "nvim-0.7" ~= 1 then
  vim.notify("Please upgrade your Neovim base installation. Deathvim requires v0.7+", vim.log.levels.WARN)
  vim.wait(5000, function()
    return false
  end)
  vim.cmd "cquit"
end

local uv = vim.loop
local path_sep = uv.os_uname().version:match "Windows" and "\\" or "/"

---Join path segments that were passed as input
---@return string
function _G.join_paths(...)
  local result = table.concat({ ... }, path_sep)
  return result
end

---Require a module in protected mode without relying on its cached value
---@param module string
---@return any
function _G.require_clean(module)
  package.loaded[module] = nil
  _G[module] = nil
  local _, requested = pcall(require, module)
  return requested
end

---Get the full path to `$DEATHVIM_RUNTIME_DIR`
---@return string
function _G.get_runtime_dir()
  local dvim_runtime_dir = os.getenv "DEATHVIM_RUNTIME_DIR"
  if not dvim_runtime_dir then
    -- when nvim is used directly
    return vim.call("stdpath", "data")
  end
  return dvim_runtime_dir
end

---Get the full path to `$DEATHVIM_CONFIG_DIR`
---@return string
function _G.get_config_dir()
  local dvim_config_dir = os.getenv "DEATHVIM_CONFIG_DIR"
  if not dvim_config_dir then
    return vim.call("stdpath", "config")
  end
  return dvim_config_dir
end

---Get the full path to `$DEATHVIM_CACHE_DIR`
---@return string
function _G.get_cache_dir()
  local dvim_cache_dir = os.getenv "DEATHVIM_CACHE_DIR"
  if not dvim_cache_dir then
    return vim.call("stdpath", "cache")
  end
  return dvim_cache_dir
end

---Initialize the `&runtimepath` variables and prepare for startup
---@return table
function M:init(base_dir)
  self.runtime_dir = get_runtime_dir()
  self.config_dir = get_config_dir()
  self.cache_dir = get_cache_dir()
  self.pack_dir = join_paths(self.runtime_dir, "site", "pack")
  self.packer_install_dir = join_paths(self.runtime_dir, "site", "pack", "packer", "start", "packer.nvim")
  self.packer_cache_path = join_paths(self.config_dir, "plugin", "packer_compiled.lua")

  ---Get the full path to DeathVim's base directory
  ---@return string
  function _G.get_dvim_base_dir()
    return base_dir
  end

  require("dvim.defaults")
  require("dvim.keymappings").load_defaults()

  Utils = require("dvim.utils.functions")

  dvim.builtin.plugins.which_key = { mappings = {} }

  require("config")
  require("dvim.keymappings").load(dvim.keys)

  require("dvim.plugins")

  return self
end

-- Update DeathVim
-- pulls the latest changes from github and, resets the startup cache
function M:update()
  require_clean("dvim.utils.hooks").run_pre_update()
  local ret = require_clean("dvim.utils.git").update_base_dvim()
  if ret then
    require_clean("dvim.utils.hooks").run_post_update()
  end
end

return M
