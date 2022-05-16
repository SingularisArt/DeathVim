local lsp_installer = SingularisArt.call('nvim-lsp-installer', 'LSP Installer')

lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
})
