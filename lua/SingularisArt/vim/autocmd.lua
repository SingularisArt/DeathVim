SingularisArt.g.autocommand_callbacks = {}

-- Wrapper for simple autocmd use cases. `cmd` may be a string or a Lua
-- function.
local autocmd = function (name, pattern, cmd, opts)
  opts = opts or {}
  local cmd_type = type(cmd)
  if cmd_type == 'function' then
    local key = SingularisArt.util.get_key_for_fn(cmd, SingularisArt.g.autocommand_callbacks)
    SingularisArt.g.autocommand_callbacks[key] = cmd
    cmd = 'lua SingularisArt.g.autocommand_callbacks.' .. key .. '()'
  elseif cmd_type ~= 'string' then
    error('autocmd(): unsupported cmd type: ' .. cmd_type)
  end
  local bang = opts.bang and '!' or ''
  local once = opts.once and '++once' or ''
  vim.cmd(
    table.concat(
      vim.tbl_filter(
        function (item) return item ~= '' end, {
          'autocmd' .. bang,
          name,
          pattern,
          once,
          cmd,
        }
      ), ' '
    )
  )
end

return autocmd

