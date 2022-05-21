-------------------------------------------------------------------------------
-- Essentially, what this file does is it loads requires the plugins and it  --
-- automatically checks if the plugin is installed. You can configure the    --
-- options for this file in the 'lua/SingularisArt/vars.lua' file.           --
-- EX: require_plugin('plugin_name', 'plugin_display_name')                  --
-------------------------------------------------------------------------------

local options = require('SingularisArt.vars')

local load_plugin_safely = function(plugin_to_require, plugin_to_display_error)
  local status, object = pcall(require, plugin_to_require)

  if options.display_if_plugin_is_not_installed  then
    if not status then
      vim.notify("Please Install '" .. plugin_to_display_error .. "'")
      return
    end
  end

  if options.display_if_plugin_is_installed then
    if status then
      vim.notify("'" .. plugin_to_display_error .. "' is installed and loaded")
    end
  end

  return object
end

return load_plugin_safely
