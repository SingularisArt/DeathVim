local M = {}

M.config = function()
  dvim.builtin.plugins.nvim_tree.setup = {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    open_on_setup_file = false,
    sort_by = "name",
    ignore_buffer_on_setup = false,
    ignore_ft_on_setup = {
      "startify",
      "dashboard",
      "alpha",
    },
    auto_reload_on_write = true,
    hijack_unnamed_buffer_when_opening = false,
    hijack_directories = {
      enable = true,
      auto_open = true,
    },
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = false,
    diagnostics = {
      enable = dvim.use_icons,
      show_on_dirs = false,
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {},
    },
    system_open = {
      cmd = nil,
      args = {},
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 200,
    },
    view = {
      width = 30,
      height = 30,
      hide_root_folder = false,
      side = "left",
      preserve_window_proportions = false,
      mappings = {
        custom_only = false,
        list = {},
      },
      number = false,
      relativenumber = false,
      signcolumn = "yes",
    },
    renderer = {
      indent_markers = {
        enable = false,
        icons = {
          corner = "└ ",
          edge = "│ ",
          none = "  ",
        },
      },
      icons = {
        webdev_colors = dvim.use_icons,
        show = {
          git = dvim.use_icons,
          folder = dvim.use_icons,
          file = dvim.use_icons,
          folder_arrow = dvim.use_icons,
        },
      },
      highlight_git = true,
      root_folder_modifier = ":t",
    },
    filters = {
      dotfiles = false,
      custom = { "node_modules", "\\.cache" },
      exclude = {},
    },
    trash = {
      cmd = "trash",
      require_confirm = true,
    },
    log = {
      enable = false,
      truncate = false,
      types = {
        all = false,
        config = false,
        copy_paste = false,
        diagnostics = false,
        git = false,
        profile = false,
      },
    },
    actions = {
      use_system_clipboard = true,
      change_dir = {
        enable = true,
        global = false,
        restrict_above_cwd = false,
      },
      open_file = {
        quit_on_open = false,
        resize_window = false,
        window_picker = {
          enable = true,
          chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
          exclude = {
            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
            buftype = { "nofile", "terminal", "help" },
          },
        },
      },
    },
  }
end

M.setup = function()
  M.config()

  local nvim_tree = require_clean("nvim-tree")

  nvim_tree.setup(dvim.builtin.plugins.nvim_tree.setup)
end

return M
