Death.NeoVim
============

This is a simple, but yet, elegant neovim setup.

![pic1](media/main.png)

# Install Language support

You can find a list of supported languages
[here](https://github.com/kabouzeid/nvim-lspinstall/tree/main/lua/lspinstall/servers).

To install any of them run

* Enter `:LspInstall` followed by <TAB> to see your options for LSP
* Enter `:TSInstall` followed by <TAB> to see your options for syntax highlighting

# Installation

> ⚠️  WARNING: Make sure you have the latest version of NeoVim. (at the time, that is 0.6.1)

## Requirements

Right now, it only works on Linux (32 bit and 64 bit).

But before doing that, make sure you back-up your NeoVim configuration just in case. You do that with:

```sh
cp ~/.config/nvim ~/.config/nvim-backup
git clone https://https://github.com/SingularisArt/Death.NeoVim ~/.config/nvim && cd ~/.config/nvim
git submodule update --init --recursive
```

# Usage

## Package Managers

This NeoVim config doesn't use any plugin managers. I use `git submodules`. You can view all of the plugins [here](pack/bundle/opt) and I source theme in my [init.lua](./init.lua).

### Adding plugins

Here's how you add a plugin:

```bash
git submodule --name PLUGIN-NAME https://github.com/USER/PLUGIN-NAME pack/bundle/opt/PLUGIN-NAME
```

After you've add the submodule, add this to the `init.lua` file in the section for the plugins:

```lua
SingularisArt.plugin.load('PLUGIN-NAME')
```

### Remove/Disable plugins

All you have to do to disable a plugin is to remove the calling the `init.lua`
file. If you want to permanently remove a plugin, remove it's submodule using
the following command:

```bash
git rm --cached pack/bundle/opt/PLUGIN-NAME
rm -rf pack/bundle/opt/PLUGIN-NAME
```

## Colorscheme

I use the `pywal` colorscheme, which uses the colors from the `wal` command.
[Here's](https://github.com/SingularisArt/Chameleon) a script that I made that
will change your computer's entire system colorscheme based on your wallpaper.

![colorscheme](media/colorscheme.mp4)

## Keybindings

### Basic key binds

| Function       | Keybind         |
| -------------- | --------------- |
| Leader Key     | `SPACE`         |

### Browser

| Function              | Keybind      |
| --------------------- | ------------ |
| :NvimTreeToggle       | `<Leader>e`  |
| Create new tab        | `<A-t>`      |
| Remove tab            | `<A-w>`      |
| Go to next Diagnostic | `[d`         |
| Go to prev Diagnostic | `]d`         |

### Buffers

| Function                           | Keybind        |
| ---------------------------------- | -------------- |
| :BufferLinePick                    | `<Leader>bp`   |
| :BufferLineCloseLeft               | `<Leader>bcl`  |
| :BufferLineCloseRight              | `<Leader>bcr`  |
| :BufferLineMoveNext                | `<Leader>bmn`  |
| :BufferLineMovePrev                | `<Leader>bmp`  |
| :BufferLineSortByDirectory         | `<Leader>bsd`  |
| :BufferLineSortByExtension         | `<Leader>bse`  |
| :BufferLineSortByRelativeDirectory | `<Leader>bsr`  |
| :BufferLineSortByTabs              | `<Leader>bst`  |

### Navigation

| Function                      | Keybind                   |
| ----------------------------- | ------------------------- |
| Navigate to left window       | `Ctrl+h`                  |
| Navigate to right window      | `Ctrl+l`                  |
| Navigate to top window        | `Ctrl+k`                  |
| Navigate to bottom window     | `Ctrl+j`                  |
| Next tab                      | `Tab`                     |
| Previous tab                  | `Shift+Tab`               |
| Only window                   | `<Leader>o`               |
| New tab                       | `<A-t>`                   |
| Kill buffer                   | `<A-w>`                   |
| Horizontal split              | `<Leader>h`               |
| Horizontal vsplit             | `<Leader>v`               |
| Easymotion                    | `<Leader>y`               |

### Editing

| Function                 | Keybind                   |
| ------------------------ | ------------------------- |
| :TableModeToggle         | `<Leader>tt`              |
| :TableAddFormula         | `<Leader>taf`             |
| Delete Table Row         | `<Leader>tdr`             |
| Delete Table Column      | `<Leader>tdc`             |
| Insert Table Column      | `<Leader>tic`             |
| NERDComment toggle       | `<Leader>nc`              |
| NERDComment un-toggle    | `<Leader>nu`              |
| Fix misspelled words     | `<C-l> INSERT MODE`       |

### Telescope

| Function                 | Keybind                   |
| ------------------------ | ------------------------- |
| :Telescope find_files    | `<Leader>ff`              |
| :Telescope oldfiles      | `<Leader>fo`              |
| :Telescope colorscheme   | `<Leader>fc`              |
| :Telescope buffers       | `<Leader>fb`              |
| :Telescope commands      | `<Leader>fm`              |
| :Telescope quick_fix     | `<Leader>fq`              |
| :Telescope live_grep     | `<Leader>fl`              |
| :Telescope marks         | `<Leader>fr`              |
| :Telescope projects      | `<Leader>fp`              |
| :Telescope git_status    | `<Leader>fgs`             |
| :Telescope git_files     | `<Leader>fgf`             |
| :Telescope git_commits   | `<Leader>fgc`             |
| :Telescope git_branches  | `<Leader>fgb`             |
| :Telescope git_stash     | `<Leader>fgt`             |

### Git

| Function        | Keybind         |
| --------------- | --------------- |
| :Git            | `<Leader>gs`    |
| :Git add .      | `<Leader>ga`    |
| :Git diff       | `<Leader>gd`    |
| :Git commit     | `<Leader>gc`    |
| :Git push       | `<Leader>gp`    |
| :Git pull       | `<Leader>gP`    |
| :Git log        | `<Leader>gl`    |
| :LazyGit        | `<Leader>gL`    |
| :LazyGitFilter  | `<Leader>gf`    |

### Translation

| Function        | Keybind         |
| ----------------| --------------- |
| :Translate      | `<Leader>rt`    |
| :TranslateW     | `<Leader>rw`    |
| :TranslateR     | `<Leader>rr`    |

### Dashbaord

| Function          | Keybind         |
| ----------------- | --------------- |
| :Dashbaord        | `<Leader>dd`    |
| :DashboardNewFile | `<Leader>dn`    |

### LaTeX

| Function                   | Keybind         |
| -------------------------- | --------------- |
| :VimtexCompile             | `<Leader>lc`    |
| :VimtexCompileSelected     | `<Leader>ls`    |
| :VimtexInfo                | `<Leader>li`    |
| :VimtexTocToggle           | `<Leader>lt`    |
| :VimtexView                | `<Leader>lv`    |

### Misc

| Function            | Keybind         |
| ------------------- | --------------- |
| :MarkdownPreview    | `<Leader>mp`    |

### LSP

| Function                   | Keybind         |
| -------------------------- | --------------- |
| Go to next Diagnostic      | `[d`            |
| Go to prev Diagnostic      | `]d`            |
| Open/Close Terminal        | `<Alt-d>`       |
| Hover Doc                  | `<Leader>sh`    |
| Rename                     | `<Leader>sr`    |
| Code Action                | `<Leader>sc`    |
| Show Diagnostics           | `<Leader>se`    |
| Error Localist             | `<Leader>sq`    |
| Format                     | `<Leader>sf`    |
| Implement                  | `<Leader>si`    |
| Go to Definition           | `<Leader>sdd`   |
| Find files with Definition | `<Leader>sdf`   |
| Find References            | `<Leader>sdr`   |
| Type Definition            | `<Leader>sdt`   |
| Preview Definition         | `<Leader>sdp`   |
| Add workspace              | `<Leader>swa`   |
| Remove workspace           | `<Leader>swr`   |

Check [here](lua/core/keymappings.lua) for all of the mappings.

# Showcase

<img src="media/dashboard.png">
<img src="media/layout.png">
<img src="media/completion.png">

## Theme Showcase

<details><summary>Images</summary>
  <img src="media/theme-1.png">
  <img src="media/theme-2.png">
  <img src="media/theme-3.png">
  <img src="media/theme-4.png">
  <img src="media/theme-5.png">
  <img src="media/theme-6.png">
</details>

## Very useful plugins used

<details><summary>Images</summary>
  <h3>Nvim Tree</h3>
  Fast file tree:

  <img src="media/nvim-tree.png">

  <h3>Telescope-nvim</h3>
  A fuzzy file finder, picker, sorter, previewer and much more:
  <img src="media/telescope.png">

  <h3>Indent-blankline.nvim</h3>
  Adds indentline:
  <img src="media/indent-blankline.png">

  <h3>Lualine</h3>
  Highly configurable statusline plugin:
  <img src="media/lualine.png">

  <h3>Nvim-bufferline.lua</h3>
  Better tab implementation:
  <img src="media/nvim-bufferline.png">

  <h3>Nvim-web-devicons</h3>
  Lua fork of Vim Devicons which offers more file icon customisability:
  <img src="media/nvim-webdevicons.png">

  <h3>Vim-Copilot</h3>
  An AI assistant that gives you suggestions:
  <img src="media/vim-copilot.png">

  <h3>Nvim-treesitter</h3>
  Better syntax highlighting for programming languages

  Without/with Treesitter:
  <img src="media/nvim-treesitter.png">
</details>

# Contributing

If you would like to contribute, you just simply create a folder within the
`lua` folder. Then, you go ahead and create a folder that's named your username
and place your config there.

# TODO

## Completed

- [x] Setup NeoVim for taking notes in **LaTeX**.
- [x] Add git signs in the gutter area.
- [x] Add snippets.
- [x] Add **requirements** to **README.md**.
- [x] Get completion using either **Native LSP** or **COC**.
- [x] Add **features** to **README.md**.
- [x] Add TabNine.
- [x] Add GitHub copilot.

## Working on

## Need to do

- [ ] Make my own executable called **dvim**.

