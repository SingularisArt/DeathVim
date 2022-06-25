local modes = {
  { name = "trace" },
  { name = "debug" },
  { name = "info" },
  { name = "warn" },
  { name = "error" },
  { name = "fatal" },
}

local levels = {}
for i, v in ipairs(modes) do
  levels[v.name] = i
end

local round = function(x, increment)
  increment = increment or 1
  x = x / increment
  return (x > 0 and math.floor(x + .5) or math.ceil(x - .5)) * increment
end

local _tostring = tostring

local tostring = function(...)
  local t = {}
  for i = 1, select('#', ...) do
    local x = select(i, ...)
    if type(x) == "number" then
      x = round(x, .01)
    end
    t[#t + 1] = _tostring(x)
  end
  return table.concat(t, " ")
end

for i, x in ipairs(modes) do
  local nameupper = x.name:upper()
  dvim.log[x.name] = function(...)
    -- Return early if we're below the log level
    if i < levels[dvim.log.level] then
      return
    end

    local msg = tostring(...)
    local info = debug.getinfo(2, "Sl")
    local lineinfo = info.short_src .. ":" .. info.currentline

    -- Output to log file
    if dvim.log.out_file then
      local fp = io.open(dvim.log.out_file, "a")
      local str = string.format("[%-6s%s] %s: %s\n",
        nameupper, os.date(), lineinfo, msg)
      fp:write(str)
      fp:close()
    end
  end
end

return dvim.log
