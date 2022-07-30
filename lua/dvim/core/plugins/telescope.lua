local M = {}

M.config = function()
  local actions = require("telescope.actions")
  dvim.builtin.plugins.telescope.defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.75,
      preview_cutoff = 120,
      horizontal = {
        preview_width = function(_, cols, _)
          if cols < 120 then
            return math.floor(cols * 0.5)
          end
          return math.floor(cols * 0.6)
        end,
        mirror = false,
      },
      vertical = { mirror = false },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob=!.git/",
    },
    mappings = {
      i = {
        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,
        ["<C-c>"] = actions.close,
        ["<C-j>"] = actions.cycle_history_next,
        ["<C-k>"] = actions.cycle_history_prev,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<CR>"] = actions.select_default,
      },
      n = {
        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      },
    },
    file_ignore_patterns = {},
    path_display = { shorten = 5 },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    pickers = {
      find_files = {
        hidden = true,
      },
      live_grep = {
        --@usage don't include the filename in the search results
        only_sort_text = true,
      },
    },
  }
end

M.setup = function()
  M.config()

  local telescope = require("telescope")
  telescope.setup(dvim.builtin.plugins.telescope.defaults)

  if dvim.builtin.plugins.project.active then
    pcall(function()
      require("telescope").load_extension("projects")
    end)
  end

  if dvim.builtin.plugins.notify.active and dvim.builtin.plugins.telescope.extensions.notify then
    pcall(function()
      require("telescope").load_extension("notify")
    end)
  end

  if dvim.builtin.plugins.telescope.on_config_done then
    dvim.builtin.plugins.telescope.on_config_done(telescope)
  end

  if dvim.builtin.plugins.telescope.extensions.active and dvim.builtin.plugins.telescope.extensions.file_browser then
    pcall(function()
      require("telescope").load_extension("file_browser")
    end)
  end
end

return M
