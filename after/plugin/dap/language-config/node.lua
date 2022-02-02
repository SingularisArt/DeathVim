local dap_status, dap = pcall(require, "dap")

if not dap_status then
	vim.notify("Please Install 'nvim-dap'")
	return
end

dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = {
		vim.fn.stdpath("data") .. "/dapinstall/jsnode_dbg/" .. "/vscode-node-debug2/out/src/nodeDebug.js",
	},
}

dap.configurations.javascript = {
	{
		type = "node2",
		request = "launch",
		program = "${workspaceFolder}/${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
}
