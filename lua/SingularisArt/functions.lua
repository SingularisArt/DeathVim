local M = {}

function M.safe_require(plugin_name)
  local status_ok, plugin = pcall(require, plugin_name)
  if not status_ok then
    return
  end

  return plugin
end

return M
