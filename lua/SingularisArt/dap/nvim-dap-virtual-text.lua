local status_ok, nvim_dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if not status_ok then
  return
end

nvim_dap_virtual_text.setup()
