local M = {}

local if_nil = vim.F.if_nil

local function git_cmd(opts)
  local Job = require_clean("plenary.job")

  opts = opts or {}
  opts.cwd = opts.cwd or get_dvim_base_dir()

  local stderr = {}
  local stdout, ret = Job:new({
    command = "git",
    args = opts.args,
    cwd = opts.cwd,
    on_stderr = function(_, data)
      table.insert(stderr, data)
    end,
  }):sync()

  return ret, stdout
end

local function safe_deep_fetch()
  local ret, result = git_cmd({ args = { "rev-parse", "--is-shallow-repository" } })
  if ret ~= 0 then
    return
  end
  -- git fetch --unshallow will cause an error on a a complete clone
  local fetch_mode = result[1] == "true" and "--unshallow" or "--all"
  ret = git_cmd({ args = { "fetch", fetch_mode } })
  if ret ~= 0 then
    return
  end
  return true
end

---pulls the latest changes from github
function M.update_base_dvim()
  local ret = git_cmd({ args = { "fetch" } })
  if ret ~= 0 then
    return
  end

  ret = git_cmd({ args = { "diff", "--quiet", "@{upstream}" } })
  if ret == 0 then
    return
  end

  ret = git_cmd({ args = { "merge", "--ff-only", "--progress" } })
  if ret ~= 0 then
    return
  end

  return true
end

---Switch Lunarvim to the specified development branch
---@param branch string
function M.switch_dvim_branch(branch)
  if not safe_deep_fetch() then
    return
  end
  local args = { "switch", branch }

  if branch:match("^[0-9]") then
    -- avoids producing an error for tags
    vim.list_extend(args, { "--detach" })
  end

  local ret = git_cmd({ args = args })
  if ret ~= 0 then
    return
  end
  return true
end

---Get the current Lunarvim development branch
---@return string|nil
function M.get_dvim_branch()
  local _, results = git_cmd({ args = { "rev-parse", "--abbrev-ref", "HEAD" } })
  local branch = if_nil(results[1], "")
  return branch
end

---Get currently checked-out tag of Lunarvim
---@return string
function M.get_dvim_tag()
  local args = { "describe", "--tags", "--abbrev=0" }

  local _, results = git_cmd({ args = args })
  local tag = if_nil(results[1], "")
  return tag
end

---Get currently running version of Lunarvim
---@return string
function M.get_dvim_version()
  local current_branch = M.get_dvim_branch()

  local dvim_version
  if current_branch ~= "HEAD" or "" then
    dvim_version = current_branch .. "-" .. M.get_dvim_current_sha()
  else
    dvim_version = "v" .. M.get_dvim_tag()
  end
  return dvim_version
end

---Get the commit hash of currently checked-out commit of Lunarvim
---@return string|nil
function M.get_dvim_current_sha()
  local _, log_results = git_cmd({ args = { "log", "--pretty=format:%h", "-1" } })
  local abbrev_version = if_nil(log_results[1], "")
  return abbrev_version
end

return M
