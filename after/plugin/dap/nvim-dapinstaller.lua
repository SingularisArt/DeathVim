local dap_install = SingularisArt.call('dap', 'DAP')

dap_install.adapters.cpptools = {
  type = 'executable',
  command = os.getenv('HOME') .. '/workspace/tmp/cpptools-linux/extension/debugAdapters/OpenDebugAD7',
}
