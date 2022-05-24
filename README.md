<p align="center">💀 A Hackable, Fully Featured, Rice Friendly NeoVim Configuration 💀</p>

<p align="center">
  <a href="#features">Features</a> •
  <a href="#installation">Installation</a> •
  <a href="#usage">Usage</a> •
  <a href="#showcase">Showcase</a> •
  <a href="#setting-up-pywal">Setting up PyWal</a> •
  <a href="#required-tools">Required Tools</a> •
  <a href="#todo">TODO</a>
  <br>
  <br>
  <a href="https://github.com/SingularisArt/Death.NeoVim/stargazers">
    <img src="https://img.shields.io/github/stars/SingularisArt/Death.NeoVim.svg?style=flat-square&logo=hackaday"/>
  </a>
  <a href="https://github.com/SingularisArt/Death.NeoVim/commits/master">
    <img src="https://img.shields.io/github/last-commit/SingularisArt/Death.NeoVim.svg?style=flat-square&logo=vim"/>
  </a>
  <a href="https://github.com/SingularisArt/Death.NeoVim.svg">
    <img src="http://hits.dwyl.com/SingularisArt/Death.NeoVim.svg"/>
  </a>

<p align="center">
  <img src="https://stars.medv.io/SingularisArt/Death.NeoVim.svg", title="commits"/>
</p>

# Features

* Blazing fast
* Written in 100% **LUA**
* Has TreeSitter syntax highlighting
* Colorscheme generated with [pywal](https://github.com/dylanaraps/pywal)
* Intellisense, Completion, Linting, and Debugging
* Easily able to install LSP Servers and DAP Servers using `:LspInstall` and
  `:DPInstall`
* Git integration with [vim-fugitive](https://github.com/tpope/vim-fugitive)
  and [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
* Informative statusline and tabline with
  [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
* Code snippets powered by [UltiSnips](https://github.com/SirVer/ultisnips)
* Intelligent suggestions with
  [vim-tabnine](https://github.com/zxqfl/tabnine-vim) and
  [vim-copilot](https://github.com/github/copilot.vim)
* Simple file browsing with
  [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
* Dynamic homepage with [alpha-vim](https://github.com/goolord/alpha-nvim)
* Blur inactive panes using [vimade](https://github.com/TaDaa/vimade)
* Distraction free writing with
  [ZenMode](https://github.com/folke/zen-mode.nvim) and
  [Twilight](https://github.com/folke/twilight.nvim)
* Easily configurable to suit your needs
* Common sense keybindings
* Support [Which-Key](https://github.com/folke/which-key.nvim) so you never
  forget your keybindings
* Enhanced editing with the use of the [top plugins](#very-useful-plugins)

# Installation

> ⚠️  WARNING: Make sure you have the latest version of NeoVim. (at the time,
> that is 0.7.0)

```sh
mv ~/.config/nvim ~/.config/nvim-back
git clone https://https://github.com/SingularisArt/Death.NeoVim ~/.config/nvim
```

## Install Language support

You can find a list of supported languages
[here](https://github.com/kabouzeid/nvim-lspinstall/tree/main/lua/lspinstall/servers).

To install any of them run

* Enter `:LspInstall` followed by `<TAB>` to see your options for LSP
* Enter `:TSInstall` followed by `<TAB>` to see your options for syntax
  highlighting

# Usage

## Keybindings

<details><summary><code>Basic Key-Bindings</code></summary>
<p>
  
| Function                                | Keybind           |
| --------------------------------------- | ---------------   |
| Leader Key                              | `SPACE`           |
| Create a new tab                        | `Ctrl+t`          |
| Remove the current tab                  | `Ctrl+w`          |
| Toggle QuickFix                         | `Right Arrow`     |
| Close QuickFix                          | `Left Arrow`      |
| Previous QuickFix item                  | `Up Arrow`        |
| Next QuickFix item                      | `Down Arrow`      |
| Format file                             | `Ctrl+s`          |
| Correct a misspelled word               | `Ctrl+l`          |
| Create a vertical split                 | `<Leader>+v`      |
| Create a horizontal split               | `<Leader>+h`      |
| Close all splits                        | `<Leader>+o`      |
| Highlight everything                    | `Ctrl+a`          |
| Move text up                            | `J` (VISUAL MODE) |
| Move text down                          | `K` (VISUAL MODE) |
| Move text up                            | `<Leader>j`       |
| Move text down                          | `<Leader>k`       |
| Open NvimTree                           | `<Leader>e`       |
| Toggle easymotion                       | `<Leader>y`       |
| Toggle SymbolsOutline                   | `<Leader>u`       |

</p>
</details>

<details><summary><code>Packer</code></summary>
<p>
  
| Function                                | Keybind         |
| --------------------------------------- | --------------- |
| Install plugins                         | `<Leader>pi`    |
| Update plugins                          | `<Leader>pu`    |
| Clean plugins                           | `<Leader>pc`    |
| Load plugins                            | `<Leader>pl`    |
| Sync plugins                            | `<Leader>ps`    |
| Bring profile                           | `<Leader>pp`    |

</p>
</details>

<details><summary><code>Buffers</code></summary>
<p>
  
| Function                                | Keybind         |
| --------------------------------------- | --------------- |
| Pick from the buffers                   | `<Leader>bp`    |
| Close all buffers to the left           | `<Leader>bcl`   |
| Close all buffers to the right          | `<Leader>bcr`   |
| Move buffer next                        | `<Leader>bmn`   |
| Move buffer previous                    | `<Leader>bmp`   |
| Sort buffers by directory               | `<Leader>bsd`   |
| Sort buffers by extension               | `<Leader>bse`   |
| Sort buffers by relative directory      | `<Leader>bsr`   |
| Sort buffers by tabs                    | `<Leader>bst`   |

</p>
</details>

<details><summary><code>Git</code></summary>
<p>
  
| Function                                | Keybind         |
| --------------------------------------- | --------------- |
| Git status                              | `<Leader>gs`    |
| Git add                                 | `<Leader>ga`    |
| Git commit                              | `<Leader>gc`    |
| Git push                                | `<Leader>gp`    |
| Git pull                                | `<Leader>gP`    |
| Git log                                 | `<Leader>gl`    |
| Git diff                                | `<Leader>gd`    |
| Lazy Git                                | `<Leader>gL`    |
| Lazy Git Filter                         | `<Leader>gf`    |

</p>
</details>

<details><summary><code>Translate</code></summary>
<p>
  
| Function                                | Keybind         |
| --------------------------------------- | --------------- |
| Show the translation in the cmd line    | `<Leader>Rt`    |
| Show the translation in a pop-up        | `<Leader>Rw`    |
| Convert the word to the translated word | `<Leader>Rr`    |

</p>
</details>

<details><summary><code>LaTeX</code></summary>
<p>
  
| Function                                | Keybind         |
| --------------------------------------- | --------------- |
| Clean                                   | `<Leader>lll`   |
| Clean Cache                             | `<Leader>llc`   |
| Compile                                 | `<Leader>lcc`   |
| Compile and show output                 | `<Leader>lco`   |
| Compile and show SS                     | `<Leader>lcs`   |
| Compile selected                        | `<Leader>lce`   |
| Reload                                  | `<Leader>lrr`   |
| Reload state                            | `<Leader>lrs`   |
| Stop                                    | `<Leader>lop`   |
| Stop all                                | `<Leader>loa`   |
| Show TOC                                | `<Leader>ltt`   |
| Show context menu                       | `<Leader>lm`    |
| Count letters                           | `<Leader>lu`    |
| Count words                             | `<Leader>lw`    |
| Document package                        | `<Leader>ld`    |
| Errors                                  | `<Leader>le`    |
| Status                                  | `<Leader>ls`    |
| View pdf                                | `<Leader>vl`    |
| Info                                    | `<Leader>li`    |

</p>
</details>

<details><summary><code>Markdown</code></summary>
<p>
  
| Function                                | Keybind         |
| --------------------------------------- | --------------- |
| Preview markdown                        | `<Leader>mp`    |

</p>
</details>

<details><summary><code>Table</code></summary>
<p>
  
| Function                                | Keybind         |
| --------------------------------------- | --------------- |
| Toggle table mode                       | `<Leader>tt`    |
| Delete row                              | `<Leader>tdd`   |
| Delete column                           | `<Leader>tdc`   |
| Insert column                           | `<Leader>tic`   |
| Add formula                             | `<Leader>tfa`   |
| Evaluate the formula on the current row | `<Leader>tfe`   |
| Get cell info                           | `<Leader>tn`

</p>
</details>

<details><summary><code>Telescope</code></summary>
<p>
  
| Function                                | Keybind         |
| --------------------------------------- | --------------- |
| Find files                              | `<Leader>fff`   |
| Find files using a file browser         | `<Leader>ffb`   |
| Git status                              | `<Leader>fgs`   |
| Git commits                             | `<Leader>fgc`   |
| Git branches                            | `<Leader>fgb`   |
| Git stash                               | `<Leader>fgt`   |
| Look through old files                  | `<Leader>fo`    |
| Go through the colorschemes             | `<Leader>fc`    |
| Go through buffers                      | `<Leader>fb`    |
| Go through commands                     | `<Leader>fm`    |
| Go through the QuickFix list            | `<Leader>fq`    |
| Do a live grep                          | `<Leader>fl`    |
| Go through marks                        | `<Leader>fm`    |
| Go through projects                     | `<Leader>fp`    |

</p>
</details>

<details><summary><code>Debugging</code></summary>
<p>
  
| Function                                | Keybind         |
| --------------------------------------- | --------------- |
| Start debug session                     | `<Leader>ds`    |
| Conditional breakpoint                  | `<Leader>dC`    |
| Toggle breakpoint                       | `<Leader>db`    |
| Toggle UI                               | `<Leader>dU`    |
| Continue                                | `<Leader>dc`    |
| Step back                               | `<Leader>db`    |
| Step into                               | `<Leader>di`    |
| Step over                               | `<Leader>do`    |
| Step out                                | `<Leader>du`    |
| Run to cursor                           | `<Leader>dR`    |
| Hover variable                          | `<Leader>dh`    |
| Get session                             | `<Leader>dg`    |
| Evaluate                                | `<Leader>de`    |
| Evaluate input                          | `<Leader>dE`    |
| Toggle repl                             | `<Leader>dr`    |
| Scopes                                  | `<Leader>dS`    |
| Pause                                   | `<Leader>dp`    |
| Disconnect                              | `<Leader>dd`    |
| Quit                                    | `<Leader>dq`    |
| Terminate                               | `<Leader>dx`    |

</p>
</details>

<details><summary><code>LSP</code></summary>
<p>
  
| Function                                 | Keybind         |
| ---------------------------------------- | --------------- |
| Go to definition                         | `<Leader>sdd`   |
| Show references                          | `<Leader>sdr`   |
| Get type definition                      | `<Leader>sdt`   |
| Show definition preview in pop-up window | `<Leader>sdp`   |
| Add workspace                            | `<Leader>swa`   |
| Remove workspace                         | `<Leader>swr`   |
| Show documentation                       | `<Leader>sh`    |
| Show code actions                        | `<Leader>sc`    |
| Show line diagnostics                    | `<Leader>se`    |
| Show QuickFix list                       | `<Leader>sq`    |
| Format                                   | `<Leader>sf`    |
| Rename                                   | `<Leader>sr`    |
| Go to implementation                     | `<Leader>si`    |
| Go to next diagnostic                    | `<Leader>sj`    |
| Go to prev diagnostic                    | `<Leader>sk`    |
| Close all windows                        | `<Leader>sC`    |

</p>
</details>

## Showcase

### Theme Showcase

<details><summary>Images</summary>
  <img src="media/themes/theme-1.png">
  <img src="media/themes/theme-2.png">
  <img src="media/themes/theme-3.png">
</details>

### Very useful plugins

<details><summary>Images</summary>
  <h4>Alpha</h4>

  Nice start when you open nvim without passing any arguments:

  <img src="media/plugins/alpha.png">

  <h4>Nvim Tree</h4>

  Fast file tree:

  <img src="media/plugins/nvim-tree.png">

  <h4>Telescope-nvim</h4>

  A fuzzy file finder, picker, sorter, previewer and much more:

  <img src="media/plugins/telescope.png">

  <h4>Nvim-bufferline.lua</h4>

  <h5>Tabline</h5>

  The tabline will display the currently open buffers, and whether they have
  been modified:

  <img src="media/plugins/tabline.png">

  <h5>Statusbar</h5>

  The statusbar displays the current branch, how many errors and warnings are
  in the current file, the mode you're in, how many newly added lines, how many
  modified lines, how many removed lines, how many spaces are in each tab, the
  encoding of the file, the file language, the line and column number, and a
  little gif showing how far you are from the top:

  <img src="media/plugins/statusbar.png">

  <h4>Nvim-web-devicons</h4>

  Lua fork of Vim Devicons which offers more file icon customisability:

  <img src="media/plugins/nvim-web-devicons.png">

  <h4>Nvim-treesitter</h4>

  Better syntax highlighting for programming languages.

  Without/with TreeSitter:

  <img src="media/plugins/nvim-treesitter.png">
</details>

### Completion

<details><summary>Images</summary>
</details>

### Filetypes

<details><summary>Images</summary>
  <h4>LaTeX</h4>

  While editing a LaTeX document, press `<Leader>lc` to start automatic
  compilation:

  <img src="media/filetypes/latex.png">

  Visit the [setting up pywal](#setting-up-pywal) section to see how we do
  this.

  <h4>Markdown</h4>

  While editing a markdown document, press `<Leader>md` to open a live preview
  of your document. You must edit the plugin settings to point to the absolute
  filepath of the css file. This shoud just mean changing the username:

  <img src="media/filetypes/md.png">

  If you are running pywal, your colors will be dynamically sourced!
</details>

### Debugging

<details><summary>Images</summary>

  Only having a couple of breakpoints. To create them, press `<Leader>dt`:

  <img src="media/debugging/debugging-1.png">

  Running the file. To do this, press `<Leader>ds`:

  <img src="media/debugging/debugging-2.png">

  Running the UI. To do this, press `<Leader>dU`:

  <img src="media/debugging/debugging-3.png">
</details>

# Setting up PyWal

First, install [pywal](https://github.com/dylanaraps/pywal). Then, download my
wal templates from
[here](https://github.com/SingularisArt/Singularis/tree/master/aspects/wal). Go
over the README file in the `templates` folder. Once you've set everything up,
go ahead and download my
[Chameleon.py](https://github.com/SingularisArt/Chameleon). Follow the
installation instructions, and voila, you have yourself a pywal-theming system!

# Required Tools

These must be installed for you to be able to use all the features:

* [pywal](https://github.com/dylanaraps/pywal) for colorscheme.

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
- [x] Add images

## Working on

- [ ] Organize the structure of my `plugins.lua` file.

## Need to do

- [ ] Make my own executable called **dvim**.
