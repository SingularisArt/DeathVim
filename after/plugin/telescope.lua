local actions_status, actions = pcall(require, "telescope.actions")

if not actions_status then
	vim.notify("Please Install 'telescope'")
	return
end

local telescope = require('telescope')

telescope.setup {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
       horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
       },
       vertical = {
          mirror = false,
       },
       width = 0.87,
       height = 0.80,
       preview_cutoff = 120,
    },
    file_ignore_patterns = { "node_modules" },
    path_display = { 'smart' },
    mappings = {
      i = {
        ['<A-n>'] = actions.cycle_history_next,
        ['<A-p>'] = actions.cycle_history_prev,
        ['<A-j>'] = actions.move_selection_next,
        ['<A-k>'] = actions.move_selection_previous,
        ['<A-c>'] = actions.close,
        ['<Down>'] = actions.move_selection_next,
        ['<Up>'] = actions.move_selection_previous,
        ['<CR>'] = actions.select_default,
        ['<A-x>'] = actions.select_horizontal,
        ['<A-v>'] = actions.select_vertical,
        ['<A-t>'] = actions.select_tab,
        ['<A-u>'] = actions.preview_scrolling_up,
        ['<A-d>'] = actions.preview_scrolling_down,
        ['<PageUp>'] = actions.results_scrolling_up,
        ['<PageDown>'] = actions.results_scrolling_down,
        ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
        ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
        ['<A-q>'] = actions.send_to_qflist + actions.open_qflist,
        ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
        ['<A-l>'] = actions.complete_tag,
        ['<A-_>'] = actions.which_key, 
      },
      n = {
        ['<esc>'] = actions.close,
        ['<CR>'] = actions.select_default,
        ['<C-x>'] = actions.select_horizontal,
        ['<C-v>'] = actions.select_vertical,
        ['<C-t>'] = actions.select_tab,
        ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
        ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
        ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
        ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
        ['j'] = actions.move_selection_next,
        ['k'] = actions.move_selection_previous,
        ['H'] = actions.move_to_top,
        ['M'] = actions.move_to_middle,
        ['L'] = actions.move_to_bottom,
        ['<Down>'] = actions.move_selection_next,
        ['<Up>'] = actions.move_selection_previous,
        ['gg'] = actions.move_to_top,
        ['G'] = actions.move_to_bottom,
        ['<C-u>'] = actions.preview_scrolling_up,
        ['<C-d>'] = actions.preview_scrolling_down,
        ['<PageUp>'] = actions.results_scrolling_up,
        ['<PageDown>'] = actions.results_scrolling_down,
        ['?'] = actions.which_key,
      },
    },
  },
  pickers = {
    find_files = { preview = true },
  },
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown {
        previewer = false,
        layout_strategy = 'horizontal',
      }
    },
  },
}

local extensions = {
  "themes",
  "terms",
  "projects",
  "file_browser",
  "ui-select",
  "media_files",
}

pcall(function()
  for _, ext in ipairs(extensions) do
    telescope.load_extension(ext)
  end
end)

local open_dir = function(config)
  local opt = require('telescope.themes').get_ivy {
    cwd = config.dir,
    prompt_title = config.title,
    shorten_path = true
  }
  require('telescope.builtin').find_files(opt)
end

