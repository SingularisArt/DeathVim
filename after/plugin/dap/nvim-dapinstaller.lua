local dap_install_status, dap_install = pcall(require, "dap")

if not dap_install_status then
  vim.notify("Please Install 'nvim-dap-install'")
  return
end

dap_install.adapters.cpptools = {
  type = 'executable',
  command = os.getenv('HOME') .. '/workspace/tmp/cpptools-linux/extension/debugAdapters/OpenDebugAD7',
}
