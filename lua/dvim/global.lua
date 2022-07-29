local uv = vim.loop
local path_sep = uv.os_uname().version:match "Windows" and "\\" or "/"

local M = {}

function M.init(base_dir)
  ---Get the full path to LunarVim's base directory
  ---@return string
  function _G.get_dvim_base_dir()
    return base_dir
  end
end

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
  local status, requested = pcall(require, module)
  if not status then
    return
  end
  return requested
end

---Get the full path to `$DEATHVIM_RUNTIME_DIR`
---@return string
function _G.get_runtime_dir()
  local dvim_runtime_dir = os.getenv("HOME") .. "/.local/share"
  if not dvim_runtime_dir then
    -- when nvim is used directly
    return vim.call("stdpath", "data")
  end
  return dvim_runtime_dir
end

---Get the full path to `$DEATHVIM_CONFIG_DIR`
---@return string
function _G.get_config_dir()
  local dvim_config_dir = os.getenv("HOME") .. "/.config/dvim"
  if not dvim_config_dir then
    -- when nvim is used directly
    return vim.call("stdpath", "config")
  end
  return dvim_config_dir
end

---Get the full path to `$DEATHVIM_CACHE_DIR`
---@return string
function _G.get_cache_dir()
  local dvim_cache_dir = os.getenv("HOME") .. "/.cache/dvim"
  if not dvim_cache_dir then
    -- when nvim is used directly
    return vim.call("stdpath", "cache")
  end
  return dvim_cache_dir
end

return M
