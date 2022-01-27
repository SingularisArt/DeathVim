local fine_cmdline_status, fine_cmdline = pcall(require, "fine-cmdline")

if not fine_cmdline_status then
	vim.notify("Please Install 'fine-cmdline'")
	return
end

fine_cmdline.setup({
  cmdline = {
    enable_keymaps = true,
    smart_history = true,
    prompt = ': '
  },
  popup = {
    position = {
      row = '45%',
      col = '50%',
    },
    size = {
      width = '50%',
    },
    border = {
      style = 'rounded',
    },
    win_options = {
      winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
    },
  },
})

