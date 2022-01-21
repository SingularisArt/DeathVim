local nvim_lsp_installer_status, lsp_installer = pcall(require, "nvim-lsp-installer")

if not nvim_lsp_installer_status then
	vim.notify("Please Install 'nvim-lsp-installer'")
	return
end

lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
})
