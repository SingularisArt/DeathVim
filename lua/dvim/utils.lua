local M = {}
local uv = vim.loop

-- recursive Print (structure, limit, separator)
local function r_inspect_settings(structure, limit, separator)
  limit = limit or 100 -- default item limit
  separator = separator or "." -- indent string
  if limit < 1 then
    print("ERROR: Item limit reached.")
    return limit - 1
  end
  if structure == nil then
    io.write("-- O", separator:sub(2), " = nil\n")
    return limit - 1
  end
  local ts = type(structure)

  if ts == "table" then
    for k, v in pairs(structure) do
      -- replace non alpha keys with ["key"]
      if tostring(k):match("[^%a_]") then
        k = '["' .. tostring(k) .. '"]'
      end
      limit = r_inspect_settings(v, limit, separator .. "." .. tostring(k))
      if limit < 0 then
        break
      end
    end
    return limit
  end

  if ts == "string" then
    -- escape sequences
    structure = string.format("%q", structure)
  end
  separator = separator:gsub("%.%[", "%[")
  if type(structure) == "function" then
    -- don't print functions
    io.write("-- dvim", separator:sub(2), " = function ()\n")
  else
    io.write("dvim", separator:sub(2), " = ", tostring(structure), "\n")
  end
  return limit - 1
end

function M.generate_settings()
  -- Opens a file in append mode
  local file = io.open("lv-settings.lua", "w")

  -- sets the default output file as test.lua
  io.output(file)

  -- write all `dvim` related settings to `lv-settings.lua` file
  r_inspect_settings(dvim, 10000, ".")

  -- closes the open file
  io.close(file)
end

--- Returns a table with the default values that are missing.
--- either parameter can be empty.
--@param config (table) table containing entries that take priority over defaults
--@param default_config (table) table contatining default values if found
function M.apply_defaults(config, default_config)
  config = config or {}
  default_config = default_config or {}
  local new_config = vim.tbl_deep_extend("keep", vim.empty_dict(), config)
  new_config = vim.tbl_deep_extend("keep", new_config, default_config)
  return new_config
end

--- Checks whether a given path exists and is a file.
--@param path (string) path to check
--@returns (bool)
function M.is_file(path)
  local stat = uv.fs_stat(path)
  return stat and stat.type == "file" or false
end

--- Checks whether a given path exists and is a directory
--@param path (string) path to check
--@returns (bool)
function M.is_directory(path)
  local stat = uv.fs_stat(path)
  return stat and stat.type == "directory" or false
end

M.join_paths = _G.join_paths

---Write data to a file
---@param path string can be full or relative to `cwd`
---@param txt string|table text to be written, uses `vim.inspect` internally for tables
---@param flag string used to determine access mode, common flags: "w" for `overwrite` or "a" for `append`
function M.write_file(path, txt, flag)
  local data = type(txt) == "string" and txt or vim.inspect(txt)
  uv.fs_open(path, flag, 438, function(open_err, fd)
    assert(not open_err, open_err)
    uv.fs_write(fd, data, -1, function(write_err)
      assert(not write_err, write_err)
      uv.fs_close(fd, function(close_err)
        assert(not close_err, close_err)
      end)
    end)
  end)
end

---Return table with integers betwene lower and upper
---@param lower integer the beginning of the range
---@param upper integer the end of the range
function M.range(lower, upper)
  local result = {}
  for i = lower, upper do
    table.insert(result, i)
  end
  return result
end

function M.join(tbl, delimiter)
  delimiter = delimiter or ""
  local result = ""
  local len = #tbl
  for i, item in ipairs(tbl) do
    if i == len then
      result = result .. item
    else
      result = result .. item .. delimiter
    end
  end
  return result
end

-- This is a (probably) temporary workaround until:
--
--    https://github.com/neovim/neovim/issues/14670
--
-- is resolved.
--
-- Basically, Vim's `setlocal` is magical, sometimes operating as buffer-local
-- and at other times as window-local.

local options = {
  breakindent = { scope = "window", type = "boolean" },
  breakindentopt = { scope = "window", type = "string" },
  colorcolumn = { scope = "window", type = "string" },
  concealcursor = { scope = "window", type = "string" },
  expandtab = { scope = "buffer", type = "boolean" },
  foldenable = { scope = "window", type = "boolean" },
  formatprg = { scope = "buffer", type = "string" },
  iskeyword = { scope = "buffer", type = "list" },
  list = { scope = "window", type = "boolean" },
  modifiable = { scope = "buffer", type = "boolean" },
  omnifunc = { scope = "buffer", type = "string" },
  readonly = { scope = "buffer", type = "boolean" },
  shiftwidth = { scope = "buffer", type = "number" },
  smartindent = { scope = "buffer", type = "boolean" },
  spell = { scope = "window", type = "boolean" },
  spellfile = { scope = "buffer", type = "string" },
  spelllang = { scope = "buffer", type = "string" },
  statusline = { scope = "window", type = "string" },
  synmaxcol = { scope = "buffer", type = "number" },
  tabstop = { scope = "buffer", type = "number" },
  textwidth = { scope = "buffer", type = "number" },
  wrap = { scope = "window", type = "boolean" },
  wrapmargin = { scope = "buffer", type = "number" },
}

function M.bail(msg)
  vim.api.nvim_err_writeln(msg)
end

function M.setlocal(name, ...)
  local args = { ... }
  local operator = nil
  local value = nil
  if #args == 0 then
    operator = "="
    value = true
  elseif #args == 1 then
    operator = "="
    value = args[1]
  elseif #args == 2 then
    operator = args[1]
    value = args[2]
  else
    return M.bail("setlocal(): expects 1 or 2 arguments, got " .. #args)
  end

  local option = options[name]
  if option == nil then
    return M.bail("setlocal(): unsupported option: " .. name)
  end

  local get = option.scope == "buffer" and vim.api.nvim_buf_get_option or vim.api.nvim_win_get_option

  local set = option.scope == "buffer" and vim.api.nvim_buf_set_option or vim.api.nvim_win_set_option

  if operator == "=" then
    set(0, name, value)
  elseif operator == "-=" then
    if option.type ~= "list" then
      return M.bail('setlocal(): operator "-=" requires list type but got ' .. option.type)
    end
    local current = vim.split(get(0, name), ",")
    print("current " .. vim.inspect(current))
    local new = vim.tbl_filter(function(item)
      return item ~= value
    end, current)
    set(0, name, M.join(new, ","))
  else
    return M.bail("setlocal(): unsupported operator: " .. operator)
  end
end

return M
