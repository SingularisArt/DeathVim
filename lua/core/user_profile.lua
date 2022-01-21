-- user profile ( switch configurations based on the active profile )
local M = {}

ENV_NAME = "NVIM_PROFILE"

M.default_profile = "personal"

function M.get_active_profile()
	local env_profile = vim.env[ENV_NAME]
	if type(env_profile) == "string" and env_profile ~= "" then
		return env_profile
	end

	return M.default_profile
end

function M.with_profile_fn(profile_name, fn, ...)
	if profile_name ~= M.get_active_profile() then
		return nil
	end

	return fn(...)
end

function M.with_profile_table(tbl)
	local active_profile = M.get_active_profile()

	local ret = tbl[active_profile]

	if not ret then
		return tbl["default"]
	end

	return ret
end

return M

