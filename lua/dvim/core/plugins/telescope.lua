local M = {}

M.config = function()
  -- Define this minimal config so that it's available if telescope is not yet available.

  dvim.builtin.plugins.telescope = {
    ---@usage disable telescope completely [not recommended]
    active = true,
    on_config_done = nil,
  }

  local actions = require("telescope.actions")
  dvim.builtin.plugins.telescope = vim.tbl_extend("force", dvim.builtin.plugins.telescope, {
    defaults = {
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
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
    },
  })
end

M.setup = function()
  M.config()

  local previewers = require("telescope.previewers")
  local sorters = require("telescope.sorters")

  dvim.builtin.plugins.telescope = vim.tbl_extend("keep", {
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
    file_sorter = sorters.get_fuzzy_file,
    generic_sorter = sorters.get_generic_fuzzy_sorter,
    ---@usage Mappings are fully customizable. Many familiar mapping patterns are setup as defaults.
    mappings = {
      f = {
        name = "Telescope",
        f = {
          name = "Find",
          f = {
            "<cmd>Telescope find_files<CR>",
            "Fuzzy Find Files",
          },
          b = {
            '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>',
            "Browser Find Files",
          },
        },
        g = {
          name = "Git",
          s = {
            "<cmd>Telescope git_status<CR>",
            "Git Status",
          },
          f = {
            "<cmd>Telescope git_files<CR>",
            "Git Files",
          },
          c = {
            "<cmd>Telescope git_commits<CR>",
            "Commits",
          },
          b = {
            "<cmd>Telescope git_branches<CR>",
            "Branches",
          },
          t = {
            "<cmd>Telescope git_stash<CR>",
            "Stash",
          },
        },
      },
    },
  }, dvim.builtin.plugins.telescope)

  local telescope = require("telescope")
  telescope.setup(dvim.builtin.plugins.telescope)

  if dvim.builtin.plugins.project.active then
    pcall(function()
      require("telescope").load_extension("projects")
    end)
  end

  if dvim.builtin.plugins.notify.active then
    pcall(function()
      require("telescope").load_extension("notify")
    end)
  end

  if dvim.builtin.plugins.telescope.on_config_done then
    dvim.builtin.plugins.telescope.on_config_done(telescope)
  end

  if dvim.builtin.plugins.telescope.extensions and dvim.builtin.plugins.telescope.extensions.fzf then
    pcall(function()
      require("telescope").load_extension("fzf")
    end)
  end
end

return M
