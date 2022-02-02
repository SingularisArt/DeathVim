local nvim_dap_ui_status, dapui = pcall(require, "dapui")

if not nvim_dap_ui_status then
	vim.notify("Please Install 'nvim-dap-ui'")
	return
end

dapui.setup()
