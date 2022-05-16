local options = require('SingularisArt.vars')

local call = function(plugin_to_require, plugin_to_display_error)
  local status, object = pcall(require, plugin_to_require)

  if options.notifications then
    if not status then
      vim.notify("Please Install '" .. plugin_to_display_error .. "'")
    end
  end
  if options.text then
    if not status then
      print("Please Install '" .. plugin_to_display_error .. "'")
      return
    end
  end

  return object
end

return call
