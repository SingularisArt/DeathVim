local notify_status, notify = pcall(require, "notify")

if not notify_status then
	error("Please Install 'notify'")
	return
end

vim.notify = notify
