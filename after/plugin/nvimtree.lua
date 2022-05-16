local tree = SingularisArt.call('nvim-tree', 'Nvim Tree')

local icons = {
  git = {
    staged = "✓",
    renamed = "➜",
    deleted = "",
    ignored = "◌",
    unstaged = "",
    unmerged = "",
    untracked = "★",
   },
  folder = {
    open = "",
    empty = "",
    default = "",
    symlink = "",
    empty_open = "",
    symlink_open = "",
  },
}

local g = vim.g
g.nvim_tree_icons = icons
-- g.nvim_tree_indent_markers = 1
g.nvim_tree_highlight_opened_files = 2
g.nvim_tree_show_icons = { git = 1, folder_arrows = 1, folders = 1, files = 1 }

local cb = require("nvim-tree.config").nvim_tree_callback
local list = {
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  { key = "<C-e>",                        action = "edit_in_place" },
  { key = {"O"},                          action = "edit_no_picker" },
  { key = {"<2-RightMouse>", "<C-]>"},    action = "cd" },
  { key = "<C-v>",                        action = "vsplit" },
  { key = "<C-x>",                        action = "split" },
  { key = "<C-t>",                        action = "tabnew" },
  { key = "<",                            action = "prev_sibling" },
  { key = ">",                            action = "next_sibling" },
  { key = "P",                            action = "parent_node" },
  { key = "<BS>",                         action = "close_node" },
  { key = "<Tab>",                        action = "preview" },
  { key = "K",                            action = "first_sibling" },
  { key = "J",                            action = "last_sibling" },
  { key = "I",                            action = "toggle_git_ignored" },
  { key = "H",                            action = "toggle_dotfiles" },
  { key = "R",                            action = "refresh" },
  { key = "a",                            action = "create" },
  { key = "d",                            action = "remove" },
  { key = "D",                            action = "trash" },
  { key = "r",                            action = "rename" },
  { key = "<C-r>",                        action = "full_rename" },
  { key = "x",                            action = "cut" },
  { key = "c",                            action = "copy" },
  { key = "p",                            action = "paste" },
  { key = "y",                            action = "copy_name" },
  { key = "Y",                            action = "copy_path" },
  { key = "gy",                           action = "copy_absolute_path" },
  { key = "[c",                           action = "prev_git_item" },
  { key = "]c",                           action = "next_git_item" },
  { key = "-",                            action = "dir_up" },
  { key = "s",                            action = "system_open" },
  { key = "q",                            action = "close" },
  { key = "g?",                           action = "toggle_help" },
  { key = "W",                            action = "collapse_all" },
  { key = "S",                            action = "search_node" },
  { key = "<C-k>",                        action = "toggle_file_info" },
  { key = ".",                            action = "run_file_command" }
}

tree.setup {
  open_on_setup = true,
  update_cwd = true,
  -- auto_close = true,
  disable_netrw = true,
  hijack_cursor = true,
  diagnostics = { enable = true },
  git = { enable = true, ignore = false, },
  update_focused_file = { enable = false, update_cwd = false, },
  view = { hide_root_folder = false, mappings = { custom_only = true, list = mappings } },
}
