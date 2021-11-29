Death.NeoVim
============

# Gallery

## Dashboard

![pic1](media/dashboard.png)

## Completion [check]

![pic2](media/completion-1.png)
![pic3](media/completion-2.png)
![pic4](media/completion-3.png)

## Markdown

![pic5](media/markdown.png)

## LaTeX

![pic6](media/latex.png)

## Fuzzy File Finder

![pic7](media/fuzzy-file-finder.png)

## Which Key

![pic8](media/which-key.png)

# Table of Contents

* [Gallery](#gallery)
  * [Dashboard](#dashboard)
  * [Completion](#completion)
  * [Nvim Tree](#nvim-tree)
  * [Markdown](#markdown)
  * [LaTeX](#latex)
  * [Fuzzy File Finder](#fuzzy-file-finder)
  * [Translator](#translator)
  * [Which Key](#which-key)
* [Features](#features)
* [Overview](#overview)
* [Install In Three Lines](#install-in-three-lines)
  * [Installing](#installing)
   * [Requirements](#requirements)
* [Usage](#usage)
  * [Keybindings](#keybindings)
    * [Basic key binds](#basic-key-binds)
    * [Browser](#browser)
    * [Buffers](#buffers)
    * [Navigation](#navigation)
    * [Editing](#editing)
    * [Telescope](#telescope)
    * [Git](#git)
    * [Translation](#translation)
    * [LaTeX](#latex-1)
    * [Misc](#misc)
    * [LSP](#lsp)
  * [All of my plugins](#all-of-my-plugins)
* [TODO](#todo)

# Features

TODO: Must add features

# Overview

I switched from `Vim-Plug` to `Packer`, which was an investment worth doing because when I used `Vim-Plug`, I had like 87 plugins, which took about 4-5 seconds to boot up.
But now with `Packer`, it only takes 0.5 seconds, but I also lowered the number of plugins down to 29. (My main goal is to have all plugins written in `lua` because I **HATE** `vimscript`)

# Install In Three Lines

> ⚠️  WARNING: Make sure you have the latest version of NeoVim. (at the time, that is 0.5.0)

## Installing

### Requirements

Right now, it only works on linux (32 bit and 64 bit).

But before doing that, make sure you back-up your neovim configuration just in case. You do that with:

```sh
cp ~/.config/nvim ~/.config/nvim-backup
git clone https://https://github.com/SingularisArt/Death.NeoVim ~/.config/nvim
cd ~/.config/nvim && ./script
```
# Usage

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
| New tab                       | `<Leader>n`               |
| Horizontal split              | `<Leader>s`               |
| Horizontal vsplit             | `<Leader>v`               |
| Kill buffer                   | `<Leader>k`               |
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
| :Telescope colorscheme   | `<Leader>fc`              |
| :Telescope commands      | `<Leader>fo`              |
| :Telescope quick_fix     | `<Leader>fq`              |
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

## All of my plugins

- [Plugin Manager](https://github.com/wbthomason/packer.nvim) - For **lsp**.
- [LSP](https://github.com/neovim/nvim-lspconfig) - For **lsp**.
- [LSP](https://github.com/tamago324/nlsp-settings.nvim) - For **lsp**.
- [LSP](https://github.com/jose-elias-alvarez/null-ls.nvim) - For **lsp**.
- [LSP](https://github.com/kabouzeid/nvim-lspinstall) - For **lsp**.
- [color](https://github.com/norcalli/nvim-colorizer.lua) - To see **hex colors**.
- [polyglot](https://github.com/sheerun/vim-polyglot) - Better syntax and easier than **TreeSitter**.
- [telescope](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy file finder.
- [popup](https://github.com/nvim-lua/popup.nvim) - Needed for **Telescope**.
- [plenary](https://github.com/nvim-lua/plenary.nvim) - Also needed for **Telescope**.
- [compe](https://github.com/hrsh7th/nvim-compe) - Autosuggestions (very cool).
- [ultisnips](https://github.com/SirVer/UltiSnips) - Snippet manager.
- [vim-snippets](https://github.com/honza/vim-snippets) - Snippets.
- [tabnine](https://github.com/codota/tabnine-vim) - AI Autocomplete (Coming Soon).
- [goyo](https://github.com/junegunn/goyo.vim) - Goyo is distraction free.
- [autopairs](https://github.com/windwp/nvim-autopairs) - Auto pairing my brackets.
- [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua) - File browser.
- [wal](https://github.com/dylanaraps/wal.vim) - My colorscheme (to go along with my system colorscheme).
- [which-key](https://github.com/folke/which-key.nvim) - Helps me remember my keys.
- [comment](https://github.com/scrooloose/nerdcommenter) - Comments stuff quickly.
- [icons](https://github.com/kyazdani42/nvim-web-devicons) - Nice icons for items such as NvimTree.
- [status bar](https://github.com/vim-airline/vim-airline) - My nice statusbar.
- [dashboard](https://github.com/glepnir/dashboard-nvim) - Nice startup thing.
- [terminal](https://github.com/voldikss/vim-floaterm) - Quick terminal popup.
- [translators](https://github.com/voldikss/vim-translator) - Translats things.
- [lua dev](https://github.com/folke/lua-dev.nvim) - Nice plugin for lua development.
- [syntax errors](https://github.com/folke/trouble.nvim) - Kind of like syntastic, but better.
- [tags](https://github.com/simrat39/symbols-outline.nvim) Kind of like tag bar, but better.
- [wildmenu](https://github.com/gelguy/wilder.nvim) - Nicer wildmenu.
- [LaTeX](https://github.com/lervag/vimtex) - LaTeX support.
- [lazygit](https://github.com/kdheepak/lazygit.nvim) - Lazygit within vim (Now that's cool).
- [markdown](https://github.com/iamcco/markdown-preview.nvim) - Markdown view.
- [cursors](https://github.com/terryma/vim-multiple-cursors) - Multi cursor (kind of like **atom**)
- [vimtex](https://github.com/lervag/vimtex) - Makes better highlighting.
- [conceal](https://github.com/KeitaNakamura/tex-conceal.vim) - Does something.

# TODO

- [x] Add all of my plugins.
- [x] Setup neovim for taking notes in **LaTeX**.
- [x] Add git signs in the gutter area.
- [x] Add snippets.
- [x] Add **requirements** to **README.md**.
- [x] Get completion using either **Native LSP** or **COC**.
- [x] Add **features** to **README.md**.
- [ ] Add tabnine.

