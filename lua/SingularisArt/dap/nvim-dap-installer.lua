local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

dap.adapters.cpptools = {
  type = 'executable',
  command = os.getenv('HOME') .. '/workspace/tmp/cpptools-linux/extension/debugAdapters/OpenDebugAD7',
}
